# App - Web

## Binary Battle

The goal of this assignment is to _assess_ your current capability of building a database-driven web application. The project specifications are sparse (but sufficient), and minimal help will be given to you while you work to build this application.

The following items are being assessed with this assignment:

_Does the student..._

- ... design a viable database schema?
- ... build the necessary models, controllers, and views to implement the application's features?
- ... write perfectly indented, spaced, and organized code?
- ... write appropriate code comments in a consistent format?
- ... take small steps to build each feature, **as evidenced by frequent commits in Git**?

Work on this assessment alone.

### Project Specifications

The purpose of this application is to get the world's help in deciding what the _best_ of a particular group is. For example, given a group of the seven dwarves (from the _Snow White_ story), this application would collect votes about who the best dwarf is.

These are no standard ballots though. This is a **binary battle**. Continuing with the seven dwarves example...

#### Voting

1. A user visits the website and arrives at the homepage.
2. On the homepage, they see the names of two dwarves: "Sleepy" and "Grumpy". Next to each name is a button--presumably to submit some form. There also instructions telling the user to choose the better dwarf.
3. The user clicks the button next to "Sleepy".
4. That takes them to a new page that says, "Added a vote for Sleepy over Grumpy" and offers a link to "Vote again?"
5. They click "Vote again?" and are taken back to the homepage. This time, however, the two dwarves' names are "Bashful" and "Doc".
6. The user clicks the button next to "Doc", and once again is taken to a new page that says "Added a vote for Doc over Bashful" and an offer to vote again.

This process repeats endlessly, until the user chooses to stop voting.

Over time, many [hypothetical] people visit this site and make their votes. In theory, as more and more people vote for one dwarf over another, a ranking of dwarves will emerge.

#### Reporting

If the user wants to see which is the _best_ dwarf, based on the current votes, they can visit a page that ranks all of the dwarves.

Specifically, they should see the following information represented in some way:

1. A list of all matchups so far and who won. (E.g. "Sleepy was picked over Grumpy".)
2. An ordered list of the dwarves ranked.

Ranking is not necessarily simple. If two dwarves have the same number of votes, the one that's ranked higher should be the one who was picked more often than the other. E.g. if both Sleepy and Bashful were picked 8 times in their respective matchups; but Sleepy was picked _over Bashful_ more than Bashful was picked over Sleepy, then Sleepy is ranked higher.

Note: If you are greedy, then this ranking will take you approximately 4 weeks to build. It can get **super complicated**. Start simple. And, for this assignment, also end simple. The ranking algorithm I've laid out above is sufficient for now. If there is still a tie between two dwarves, then just pick a way to arbitarily settle it.

#### Bonus

**After finishing the core set of features,** you can consider adding these features:

##### Track Voting Bias

There might be some bias in voting, if people are more likely to vote for the dwarf that's listed first. Or maybe they are more likely to vote for the one listed second! Either way, it'll be smart to store that information.

So for each vote that's recorded, store whether the dwarf who was picked happened to be the one that was listed first.

Then add a feature to your Reporting page that indicates the percentage of votes that are for first-listed versus second-listed.

##### Multiple Nominee Groups

Instead of getting right to the voting, the homepage lists groups of nominees. E.g. "best dwarf", "best David Lean movie", "best superhero", "best city", etc. Visitors click a group to begin voting for nominees inside that group.

Related: Users can create their own nominee groups, which then show up on the homepage for the world to see.

#### Warning

Do not try to add a feature that prevents users from voting after a certain point. We have not covered user authentication yet, so this feature is premature at this stage.