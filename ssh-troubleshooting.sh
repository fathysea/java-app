#!/bin/bash

# SSH Key Troubleshooting Guide for Jenkins
echo "=== SSH Key Troubleshooting Guide ==="

echo "1. Check if your SSH key is in the correct format:"
echo "   - SSH keys should start with '-----BEGIN OPENSSH PRIVATE KEY-----' or '-----BEGIN RSA PRIVATE KEY-----'"
echo "   - Ensure there are no extra spaces or characters"
echo "   - Each line should be exactly as generated"

echo ""
echo "2. Convert SSH key format if needed:"
echo "   # If you have a newer OpenSSH key format, convert to RSA format:"
echo "   ssh-keygen -p -m PEM -f ~/.ssh/your-key"

echo ""
echo "3. Check Jenkins credential configuration:"
echo "   - Go to Jenkins → Manage Jenkins → Manage Credentials"
echo "   - Find your 'ec2-ssh' credential"
echo "   - Ensure it's set up as 'SSH Username with private key'"
echo "   - Username should be 'ec2-user'"
echo "   - Private key should be 'Enter directly' with the full key content"

echo ""
echo "4. Test SSH connection manually:"
echo "   ssh -i /path/to/your/key -o StrictHostKeyChecking=no ec2-user@54.191.105.177 'echo Connection successful'"

echo ""
echo "5. Common fixes for 'error in libcrypto':"
echo "   a) Key format issue - convert to RSA format"
echo "   b) Key permissions - ensure 600 permissions"
echo "   c) Key corruption - regenerate and re-upload"
echo "   d) Jenkins SSH plugin version - update if old"

echo ""
echo "6. Alternative solutions:"
echo "   a) Use withCredentials instead of sshagent"
echo "   b) Use SSH password authentication (less secure)"
echo "   c) Use Jenkins SSH Pipeline Steps plugin"

echo ""
echo "7. Generate a new SSH key pair if needed:"
echo "   ssh-keygen -t rsa -b 4096 -m PEM -f ~/.ssh/ec2-key"
echo "   # Copy the public key to your EC2 instance:"
echo "   ssh-copy-id -i ~/.ssh/ec2-key.pub ec2-user@54.191.105.177"

echo ""
echo "8. Debug Jenkins SSH issues:"
echo "   - Check Jenkins logs: /var/jenkins_home/logs/"
echo "   - Enable debug logging for SSH in Jenkins"
echo "   - Test connection from Jenkins server directly"

echo ""
echo "=== End of Guide ==="
