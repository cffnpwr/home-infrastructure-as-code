resource "null_resource" "setup_k8s_cluster" {
  provisioner "local-exec" {
    command = "ansible-playbook -i hosts.yaml ./playbooks/playbook.yaml -kK"
  }
}
