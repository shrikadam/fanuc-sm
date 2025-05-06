import socket
import math
import struct
import time
import select

def valid_connection(sock):
    readable, writable, errors = select.select([], [sock], [sock], 1.0)
    if errors or not writable:
        print("From Select: Client closed the connection.")
        return False
    return True

def main():
    # Parameter setup
    SERVER_HOST = '192.168.1.2'
    SERVER_PORT = 30000

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
        while valid_connection(client_socket):
            data = client_socket.recv(4)
            if data:
                # Unpack the binary data to an integer
                trigger = struct.unpack('!I', data)[0]  # '!I' for big-endian unsigned int, '<I' otherwise
                if(trigger==31):
                    print("Capturing...")
                    cap = struct.pack('!I', 1)
                    client_socket.send(cap)
                elif(trigger==41):
                    print("Sending LR Ref Transform")
                    ref = struct.pack('!6f', 0.0, 20.0, 0.0, 0.0, 0.0, 0.0)
                    client_socket.send(ref)
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