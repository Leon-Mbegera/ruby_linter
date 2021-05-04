<img alt="Ruby" src="https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white"/>
# Build my own ruby_linter Project

- In this project, I have emulated the purpose of a linter file in checking for errors in code syntax and flow.
- The program identifies the errors and informs the user about required correction from the terminal.

![screenshot](./Assets/images/output.png)

## Built with
- Ruby Language
- CSS for the checked file.

## How to run it
- Have ruby installed locally in your machine
- Clone the repository into your local machine from the terminal of your text editor e.g. VS Code
- The project should open its folders and files in your editor window.
- Install ruby colorize gems by running `gem install colorize`
- To start the linter check, run `ruby bin/main.rb` in your terminal
- Give the path to one of the files in Assets folder and press Enter.
- In this project: the linter checks for offenses in CSS file.
- Example1.css is a CSS file with errors that will inform user to make corrections.
- Example2.css is a clean CSS file that passes all checks.
- You'll see a list of Warnings and Errors of your terminal as pertaining to that file.

## Examples of Implemented checks
  - Comment check: Checks for comment on the file
  - Ending check: Checks that there is no space at the end of line.
  - Space check: Checks for two space indetation on inline code.
  - Opening bracket check: Checks opening { are at the end of rule declaration.
  - Closing bracket check: Checks closing } is on seperate line.
  - Unit check: Checks and recommends use of rem and em instead of px.

### *Comment check*
- Should be no comments
*Bad code*
 ```
 /* My styles */
.first-nav-bar {
  height: 100px;
}
```
**Accepted code**
```
.first-nav-bar {
  height: 100rem;
}
```

### ***Space check***
*- There should be two spaces before attribute.*

> **Bad code:**
```
.second-nav-bar {
margin-bottom: 3rem;
}
```

> **Accepted code:**
```
.second-nav-bar {
  margin-bottom: 3rem;
}
```

### ***Unit check***
- Recommended use of rem, or em instead of px.*

> **Bad code:**
```
.second-nav-bar {
  margin-bottom: 30px;
}
```

> **Accepted code:**
```
.second-nav-bar {
  margin-bottom: 8rem;
}
```

### Ending check
- Include ; at end of 'attribute: value' assignment line.

> **Bad code:**
```
.top-footer {
  background-color: black
}
```
> **Accepted code:**
```
.top-footer {
  background-color: black;
}
```

### Trailing space check
- Should be no extra empty spaces at end of line

> **Bad code:**
```
.media-icons a {  
  padding: 8rem;
  color: black;
  background-color: #11111115;
  border: 1rem solid #fff;
  border-radius: 50em;  
}

```
> **Accepted code:**
```
.media-icons a {  
  padding: 8rem;
  color: black;
  background-color: #11111115;
  border: 1rem solid #fff;
  border-radius: 50em;  
}
```

**Opening bracket check**
- Should have Opening bracket { at end or rule declaration. Any more code should fall on next lines.

> **Bad code:**
```
.bottom-article{font-size: 2rem;}
```
> **Accepted code:**
```
.bottom-article {
  font-size: 2rem;
}
```
### Closing bracket check
should have closing bracket } on separate line from other code.
> **Bad code:**
```
.side-article {
  font-family: 'Courier New', Courier, monospace;
}.newsletter
```
> **Accepted code:**
```
.side-article {
  font-family: 'Courier New', Courier, monospace;
}
```

## Author

👤 **Leon**

- GitHub: [@githubhandle](https://github.com/Leon-Mbegera)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/leon-mbegera-053991174/)

 
## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page].

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to Microverse.

## 📝 License 
This is a solo Ruby capstone project as a Microverse Student.
All rights reserved for Leon Mbegera.




