# 🗄️🤖 SQL & GenAI Course
**🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost**

---

# Three Independent Worlds

> **Day 1. 09:30. A corridor, and a door with a name on it.**

Raj does not go in first. He never does. Geetha reads the nameplate upside down out of habit, and Arjun, the CTO, is already looking past the door at the server cabinet in the corner.

"A data room," Geetha says. "Sounds like a vault."

"It's a spreadsheet and a nervous person," Raj says. "Ten rows each. They won't give us more until the deal is closer. The question is the one on the page."

*What exactly are we buying? Whose customers? Whose records?*

Three businesses. Three rooms. Each was somebody else's until recently, and each still carries its own name: **Meridian**, an asset management company. **Lifeline**, an individual insurance company. **RoadSure**, a vehicle insurance company. Nothing here belongs to the platform yet. You are a guest reading someone else's house.

---

## Predict

> **Before you read on:** Each company says it has "customers." If you wrote one sentence for what a customer is in each, would the three sentences be the same?

---

## Room one: Meridian

Dhanya Krishnan, Meridian's data steward, puts a laptop in front of you. She is precise and a little proud of it.

*Illustrative extract. Names and keys are invented.*

| client_key | client_name | status | holds |
|---|---|---|---|
| MAM-19884 | Hari Prasad | Active | Demat |
| MAM-20102 | Nisha Verma | Active | Mutual Funds |
| MAM-20417 | K. R. Menon | Active | Demat, Portfolio Management |
| MAM-20560 | Joseph Thomas | Dormant | Mutual Funds |
| MAM-20981 | Latha Reddy | Active | Portfolio Management |

"One row is one client," Dhanya says. "A client is a person who has opened an account with us. Dormant means no trades for a long stretch. We keep the row."

"How many clients?" Geetha asks.

"Forty-one thousand."

---

## Room two: Lifeline

Balaji Iyer is formal and protective. He turns the screen toward you only after he has closed two other windows.

*Illustrative extract.*

| policy_key | policyholder | status | product |
|---|---|---|---|
| LL/T/0090214 | Ramesh Nambiar | Lapsed | Term |
| LL/A/0061155 | Suresh Babu | In Force | Accident |
| LL/T/0093381 | Kavitha Menon | In Force | Term |
| LL/H/0044120 | Kavitha Menon | In Force | Health |
| LL/H/0052907 | Anjali George | In Force | Health |

"One row is one policy," Balaji says. "The letter in the middle is the product. T, term. H, health. A, accident."

Geetha has stopped reading upside down. "Two rows have the same name."

"Two policies," Balaji says. "Whether that is one person or two, I could not say from here. We have never needed to."

"How many customers?"

"Sixty-three thousand policies. I would not say customers."

---

## Room three: RoadSure

Farid Khan is practical and a little tired. He has done this before for other buyers.

*Illustrative extract.*

| policy_key | owner | status | vehicle |
|---|---|---|---|
| RS-76034 | Imran Sheikh | Expired | Two-wheeler |
| RS-76981 | Gopal Das | Live | Truck |
| RS-77120 | Kavita R. Menon | Live | Car |
| RS-77455 | Priya Natarajan | Live | Car |
| RS-77802 | Gopal Das | Live | Two-wheeler |

"One row is one vehicle policy," Farid says. "If you insure a car and a bike, that is two."

"Gopal Das appears twice," Arjun says.

"He insures a truck and a bike."

"How many customers?"

Farid almost smiles. "Fifty-two thousand policies. Customers, I'd have to count."

---

## The attempt

Back in the corridor, Geetha does what a banker does. She adds.

"Forty-one, sixty-three, fifty-two. That is a hundred and fifty-six thousand."

"Of what?" Arjun says.

She stops. "Customers."

"Clients, policies, and vehicle policies," Arjun says. "Three different things were just added together because they were all called by one word."

---

## The lens

You have met this before, in two places.

In [Relational Mathematics, Part 2, §3.1, Enter the Set Laboratory](../01-RELATIONAL-MATHEMATICS/02-set-operations.md), the file stopped to ask *who is a customer?* and answered it for one world. In §3.5, Relative Complement, the same file showed that **the universe is not neutral**: change it, and the answer changes.

Here are three universes, and each has its own `Ω`.

| World | One row is... | So `Ω` is a set of... | The status words |
|---|---|---|---|
| Meridian | One client | Clients | Active, Dormant |
| Lifeline | One policy | Policies | In Force, Lapsed |
| RoadSure | One vehicle policy | Vehicle policies | Live, Expired |

Two ideas from earlier in the course land here at once.

**Grain.** [Grain Foundations, Part 1, Grain Basics](../02-GRAIN-FOUNDATIONS/01-grain-basics.md) said the grain is not the key columns but what the row means in the real world. Three tables answer to the same word, `customer`, at three different grains. A row count is a count of whatever one row is.

**Domain.** [Relational Mathematics, Part 4, §7, Association](../01-RELATIONAL-MATHEMATICS/04-associations.md) defined a domain as the set of values a column is permitted to hold. These three status columns have three domains. `Active` and `Live` may feel alike, and `Lapsed` and `Expired` may feel alike, but the sets are not the same sets, and nobody has said which words match.

**That is the second thing this folder shows. A company is a universe. Inside it, even the word "customer" is a choice about what one row stands for.**

---

## The decision

Raj asks what the team will do on the first day. Arjun answers before you can.

"Nothing gets merged."

"Nothing?" Geetha says. "We have forty-one thousand people here."

"We have forty-one thousand clients, sixty-three thousand policies, and fifty-two thousand vehicle policies. We don't yet know how many people. If we merge now, we are merging three different things under one label."

You write the decision in the log, and its cost beside it.

| | |
|---|---|
| **Decision** | Treat each company as its own universe. Write down, per company, what one row is and what each status word means. Merge nothing. |
| **What it costs** | There is nothing impressive to show the investors this week. |
| **What it buys** | When the merge begins, nobody will mistake a policy for a person. |

Raj nods once. He crosses nothing out this time.

---

> **Day 1. 18:10. The corner booth.**

Geetha has the three counts on a napkin. She circles the sum and then draws a line through it.

"I came here to ask how big this is," she says. "I can't even say what unit it is measured in."

Raj does not answer. He turns the napkin so that you can read it, and puts a pen beside your hand.

"Then start with the one question we can ask," Arjun says. "If you take the three lists and ask how many *people*, what do you do first?"

---

**Next:** [03, One Person, Many Records](03-one-person-many-records.md)
*The three rooms cannot be added, only counted. What does it take to say that two rows are the same person?*

---

*Part of our mission for 🎯 Quality Education for Anyone, Anywhere, Anytime — 💫 with Comfort, Convenience at no Cost.*

**SQLVerse | Architecture | Business Evolution | 02 — Three Independent Worlds**