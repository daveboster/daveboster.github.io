---
layout: post
title: "Healthcare, technology, and lessons yet to be learned"
tags: healthcare technology learning government agile
---

In a deviation from my normal commute routine, the FM radio was on, and broadcasting the story [“An electronic health records system for veterans has caused unnecessary suffering”](https://www.npr.org/2023/05/01/1173141145/an-electronic-health-records-system-for-veterans-has-caused-unnecessary-sufferin) (npr.org, 2023).

It took decades for the VA to begin updating its electronic health records system. After breakdowns, the VA stopped all work on the $16 billion update with the Oracle-Cerner electronic health record."

In a four-minute listen, the story covers:

- a decade-long wait for an electronic health records system upgrade
- a ten-year, no-bid, ten-billion-dollar contract
- a limited rollout with critical breakdowns and gaps
- catastrophic consequences for veterans

The Veterans Affairs (VA) department press release, "[VA Signs Contract with Cerner for an Electronic Health Record System](https://digital.va.gov/ehr-modernization/news-releases/va-signs-contract-with-cerner-for-an-electronic-health-record-system/)", announced the contract in May 2018. The very first statement of the news release blatantly violates advice from an early mentor: "Underpromise and over-deliver".

> "I am pleased to announce we have signed a contract with Cerner today that will modernize the VA’s health care IT system and help provide seamless care to Veterans as they transition from military service to Veteran status, and when they choose to use community care."
>
> (digital.va.gov, 2018)

On digital.va.gov, the "more stories" section from the original press release offers a view into the timeline of the project. The [VA news releases](https://digital.va.gov/ehr-modernization/category/news-releases/) site offers a more complete view.

During the broadcast, a soundbite was played from Senator Patty Murray on the situation:

> "I've heard from providers who are burnt out trying to navigate this broken interface, patients who were unable to get medicine they rely on because of system malfunctions and even a patient who received a late cancer diagnosis because of flaws in the system. And that's just what we know right now. It is unacceptable."

That statement should make any leader, developer, or participant in software development projects pause.

It's a cautionary tale, maybe even an anti-pattern, but it's also a great opportunity to spark discussion, learning, and practice HugOps. Practicing external post-mortem analysis, discussions on bias, searching for "bright spots", and correlating to other similar situations.

There’s a similar tale almost a decade before this with the situation around software development practices and the creation of the US Healthcare.gov website.

## Don’t Go Chasing Waterfalls

I couldn’t resist a throwback to the 90’s musical group, TLC. 😉

It comes from the article Don't Go Chasing Waterfalls: A More Agile Healthcare.gov (newyorker.com, 2013) which gives some background into the US Healthcare.gov situation.

It also offers a historical review of large software systems dating back to the 1970s, particularly with Winston Royce and his description of waterfall development in his paper "Managing the Development of Large Software Systems" (Royce, 1970).

> Royce lists seven steps for software development:
>
> - begin with a full description of what the software needs to do,
> - create detailed specifications,
> - analyze these specifications,
> - create a program design,
> - write the code,
> - test it,
> - and operate it.
>
> (newyorker.com, 2013)

I once heard Uncle Bob (Robert C. Martin) talk about the misinterpretation of Royce's paper, which led to what we know as the current waterfall development model. The article highlights this as wwell:

> He goes on to predict the fate of many projects that would eventually use this development model, writing that, if testing fails, “the required design changes are likely to be so disruptive that … the development process has returned to the origin and one can expect up to a 100-percent overrun in schedule and/or costs.”
>
> (newyorker.com, 2013)

The takeaway isn't to focus on Royce or the waterfall development model, but to talk about the lessons learned from the US Healthcare.gov situation.

> If the first testing of the complete system occurred in the last two weeks of September, then Healthcare.gov was only halfway through what Royce would have described as a complete waterfall development process. The experience for millions of Americans in the weeks since, predictably, has not been good.
>
> (newyorker.com, 2013)

This wasn't the first nor the last in very expensive, very painful, and very public, cautionary tales about the dangers inherent with large software projects.

## What is it true of?

After thinking about both situations, I’m reminded of what Michael Lewis said about Daniel Kahneman in one of my favorite books “The Undoing Project” (Lewis, 2016).

> Later, when he was a university professor, Danny would tell students, *“When someone says something, don’t ask yourself if it is true. Ask what it might be true of.”*
>
> That was his intellectual instinct, his natural first step to the mental hoop: to take whatever someone had just said to him and try not to tear it down but to make sense of it.
>
> An excerpt from: The Undoing Project: A Friendship That Changed Our Minds (Lewis, 2016).

I'm interested to think more about both of these projects in this light. To dive deeper, discuss with others, and see if there’s something more to these stories and countless others like them, both publicly and within our own organizational walled gardens.

I wonder... is something profound happening where healthcare, government, and technology intersect, to prevent us from learning, understanding, and then adapting to not repeat the same mistakes? Does this unseen force reach past the intersection of these spaces, past these sectors entirely, to something greater or more fundamental?