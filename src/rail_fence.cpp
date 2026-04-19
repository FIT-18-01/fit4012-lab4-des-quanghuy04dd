#include <cctype>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

bool is_valid_message(const string &text) {
    for (char c : text) {
        if (!isalpha(static_cast<unsigned char>(c)) && c != ' ') {
            return false;
        }
    }
    return true;
}

string rail_fence_encrypt(const string &plaintext, int rails) {
    if (rails <= 1 || plaintext.empty()) return plaintext;

    vector<string> fence(rails, "");
    int rail = 0;
    int direction = 1;

    for (char c : plaintext) {
        // Keep spaces as normal characters during zigzag placement.
        fence[rail] += c;
        rail += direction;
        if (rail == rails - 1 || rail == 0) direction = -direction;
    }

    string ciphertext;
    for (const string &row : fence) ciphertext += row;
    return ciphertext;
}

string rail_fence_decrypt(const string &ciphertext, int rails) {
    if (rails <= 1 || ciphertext.empty()) return ciphertext;

    int n = static_cast<int>(ciphertext.size());
    vector<vector<char>> pattern(rails, vector<char>(n, '\n'));

    // Mark zigzag path
    int rail = 0;
    int direction = 1;
    for (int i = 0; i < n; ++i) {
        pattern[rail][i] = '*';
        rail += direction;
        if (rail == rails - 1 || rail == 0) direction = -direction;
    }

    // Fill marked cells row by row using ciphertext
    int idx = 0;
    for (int r = 0; r < rails; ++r) {
        for (int c = 0; c < n; ++c) {
            if (pattern[r][c] == '*' && idx < n) {
                pattern[r][c] = ciphertext[idx++];
            }
        }
    }

    // Read plaintext by traversing zigzag path again
    string plaintext;
    plaintext.reserve(n);
    rail = 0;
    direction = 1;
    for (int i = 0; i < n; ++i) {
        plaintext += pattern[rail][i];
        rail += direction;
        if (rail == rails - 1 || rail == 0) direction = -direction;
    }

    return plaintext;
}

string read_message_from_file(const string &path) {
    ifstream fin(path);
    if (!fin) return "";
    string line;
    getline(fin, line);
    return line;
}

int main() {
    cout << "=== Rail Fence Cipher Demo ===\n";
    cout << "1. Encrypt\n2. Decrypt\n3. Read from file and encrypt\nChoose: ";

    int choice;
    cin >> choice;
    cin.ignore();

    string message;
    int rails;

    if (choice == 3) {
        message = read_message_from_file("data/input.txt");
        cout << "Message from file: " << message << "\n";
    } else {
        cout << "Enter message: ";
        getline(cin, message);
    }

    cout << "Enter rails: ";
    cin >> rails;

    if (rails < 2) {
        cout << "Invalid rails. Please enter a value >= 2.\n";
        return 0;
    }

    if (!is_valid_message(message)) {
        cout << "Invalid input. Only letters and spaces are allowed.\n";
        return 0;
    }

    if (choice == 1 || choice == 3) {
        cout << "Ciphertext: " << rail_fence_encrypt(message, rails) << "\n";
    } else if (choice == 2) {
        cout << "Plaintext: " << rail_fence_decrypt(message, rails) << "\n";
    } else {
        cout << "Invalid choice.\n";
    }

    return 0;
}
