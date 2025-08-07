# Running the setup

Use `make` to build the images & launch docker compose. The entrypoint for the ansible control node is localhost:7681 (backed by TTYD). From there
you can run the ansible playbook as follows: `ansible-playbook playbook/playbook.yaml`.
