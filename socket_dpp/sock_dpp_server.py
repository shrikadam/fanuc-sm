import socket
import math
import struct
import time
import select

def calculate_sine_offset(i, cycle_freq, ampl):
    return ampl * math.sin(2 * math.pi * cycle_freq * i)

def valid_connection(sock):
    readable, writable, errors = select.select([], [sock], [sock], 1.0)
    if errors or not writable:
        print("From Select: Client closed the connection.")
        return False
    return True

def main():
    # Parameter setup
    SERVER_HOST = '127.0.0.1'
    SERVER_PORT = 30000
    
    poses = [[712.956, 0.0, 703.315, 0.0, -88.036, 180.0], 
             [794.868, -622.273, 779.892, 0.0, -88.036, 180.0], 
             [745.713, -326.209, 354.014, 0.0, -88.036, 180.0], 
             [612.021, 18.743, 584.324, 0.0, -88.036, 180.0],
             [52.741, 234.621, 489.832, 0.0, -88.036, 180.0]]
    i = 0

    # Create a socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind((SERVER_HOST, SERVER_PORT))
    server_socket.listen()

    print(f"Server listening for connection request on port {SERVER_PORT}...")

    client_socket = None

    try:
        # Accept Client request
        client_socket, client_address = server_socket.accept()
        print(f"Connection accepted from {client_address}")
        while valid_connection(client_socket) and (i<5):
            data = client_socket.recv(4)
            if data:
                # Unpack the binary data to an integer
                trigger = struct.unpack('<I', data)[0]  # '!I' for big-endian unsigned int, '<I' otherwise
                if(trigger==41):
                    print("Sending poses...")
                    while valid_connection(client_socket):
                        if(i>4):
                            print("All poses commanded! Stopping...")
                            break
                        cmd_pose = struct.pack('<6f', *poses[i])
                        client_socket.send(cmd_pose)
                        i = i + 1
                        resp = client_socket.recv(4)
                        ack = struct.unpack('<I', resp)[0]
                        if(ack==42):
                            print("Goal confirmation received!")
                            continue
                        else:
                            print("Goal ackowledgement not received! Stopping...")
                            break
                else: 
                    print("Unknown trigger!")
    except ConnectionResetError:
        print("Connection got reset.")
    except BrokenPipeError:
        print("\nConnection is broken.")
    except ConnectionRefusedError:
        print("\nConnection refused.")
    except KeyboardInterrupt:
        print("\nUser terminated the connection.")
    finally:
        # Close the client connection if it exists
        if client_socket:
            client_socket.close()
            print("Client connection closed.")
        # Close the connection
        server_socket.close()
        print("Server stopped.")

if __name__ == "__main__":
    main()