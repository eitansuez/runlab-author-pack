# A lab

[runlab](https://runlabs.io) lets learners take a lab in a web browser. Their own computer needs nothing installed. This manual is how you write a lab, publish it, and invite learners to take it.

A lab page has two parts. The lesson is the instructions. Beside it is a shell, a prompt on a Linux machine that was prepared for that lesson. The banner at the top of the page is the lab's title.

<figure markdown="1">
![The lab page. The lesson is on the right, and the shell is on the left.](images/lab-page.png){ width="720" }
</figure>

The learner types commands in the shell. You can put a button in the lesson that runs a command for them. You can also put a link that opens a page the machine is serving.

A small lab might only ask the learner to run `pwd`, `ls`, `mkdir`, and `cd`. A larger lab can do more. A Kubernetes lesson, for example, can start a small cluster on the machine and then ask the learner to use it. The examples in this manual are small. They show the pieces of a lab, one at a time.

When the learner is finished, they press Complete lab. That closes the lab.

You try a lab on your own computer before you publish it. The next page is how.
