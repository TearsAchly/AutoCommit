# AutoCommit

AutoCommit is a set of shell scripts designed for automating commit operations.

## Prerequisites

Before running this project, make sure you have installed and configured the following:

- **Shell Environment:** Unix-like operating system (Linux, macOS)
- **Git:** Version control system
- **GnuPG:** For GPG signing commitments (optional, if used for commit verification). Learn more about setting up GnuPG [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key).
- **GitHub Token:** Required. Obtain your GitHub token [here](https://github.com/settings/tokens).

```bash
git config --global user.email "Email YOur Account Github"
git config --global user.name "Name Your Account Github"
git config --global user.signingkey GPG_key
git config --global commit.gpgsign true
```

## Getting Started

To use the scripts in this project, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/TearsAchly/AutoCommit.git
   cd AutoCommit
   ```
2. Change the contents of the Script

   ```
   # Updated start and end dates, you can commit to the past
     start_date=""
     end_date=""
   ```
  

3. Make the scripts executable:

   ```bash
   chmod +x AutoCommitRandomDate.sh
   chmod +x SequentialAutomaticCommit.sh
   ```

4. Run the scripts:

   - **AutoCommitRandomDate.sh:** Commits with a random commit message and date.
     ```bash
     ./AutoCommitRandomDate.sh
     ```

   - **SequentialAutomaticCommit.sh:** Commits with a sequential commit message and current date.
     ```bash
     ./SequentialAutomaticCommit.sh
     ```
     
     After running the script, you should perform a push and then, will see the following output indicating successful push to your remote repository:
     
     ```bash
     USER | OS-NAME:~/Directory/AutoCommit$ git push -f origin master
     Username for 'https://github.com': GITHUB_TOKEN | UserName
     Password for 'Output In UserName Section': GTIHUB_TOKEN
     Enumerating objects: 891, done.
     Counting objects: 100% (891/891), done.
     Delta compression using up to 2 threads
     Compressing objects: 100% (593/593), done.
     Writing objects: 100% (891/891), 239.36 KiB | 1.39 MiB/s, done.
     Total 891 (delta 0), reused 0 (delta 0), pack-reused 0
     To https://github.com/UserName/RepoName.git
     [new branch]      master -> master
     ```

## Contributing

Feel free to fork this repository, make changes, and submit pull requests.

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for more information.

---

Replace placeholders like `Email YOur Account Github`, `Name Your Account Github`, `GPG_key`, `GITHUB_TOKEN`, with your actual GitHub account details and repository information. This README.md provides comprehensive instructions on setup, usage, and contribution guidelines for your AutoCommit project.
