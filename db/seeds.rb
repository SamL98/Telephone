# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

texts = [
    "A local museum is opening a new modern art exhibit.  The exhibit will be open to all citizens for 2 months in the summer.  The work of a local up and coming artist will be highlighted in the new exhibit.  Some of the pieces in the exhibit contain nudity and strong suggestions of sexual activity.  The museum\'s board of directors has solicited feedback from the community regarding the new exhibit. Some comments have expressed concerns about the nature of the exhibit, and that it might be offensive to particular audiences.  Other comments have expressed support for the exhibit citing the importance of free speech considerations.",
    "Recently, congress has been debating a newly proposed bill.  The bill would primarily be focused on providing economic assistance to individuals and families who are below or near the federal poverty level.  The bill would cost an estimated 10 billion dollars over the coming six years to fund.  Congressional leaders have been holding a number of town hall meetings to gauge public sentiment towards the new piece of legislation.  One sentiment shared at the town hall meetings has been a concern over increased government spending and potential tax increases.  Another sentiment shared at the town hall meetings has been a desire to provide necessary support to those in need.",
    "A new bill is proposed in the state legislature, and is currently being debated.  This bill would allow businesses to decline providing services to customers if doing so would violate their deeply held religious beliefs.  The bill stipulates that businesses would be protected from potential discrimination litigation in such cases.  The bill is nearly identical to other bills that have already been enacted in a number of other states.  Supporters of the bill have argued that it is an expression of freedom of religion, as granted by the 1st Amendment.  Opponents of the bill have argued that it will allow businesses to discriminate against those who hold different lifestyles and views.",
    "A well-known chemical company is seeking to buy a large plot of land from the county.  They are seeking to expand into the region, and would like to build a new plant.  This location is the first choice of the company, but they are looking into other options if they can\'t buy this land.  They want to move quickly on the project and have the plant operational by next year.  Some in the community have come forward to oppose the land purchase, citing concerns over noise and pollution due to the plant.  Others in the community have expressed their support for the purchase, pointing to the jobs and economic growth it would bring.",
    "A local organization has reserved the public outdoor amphitheater for a concert.  The band they have booked for the concert is known for their strong political views, and occasional use of explicit lyrics.  The amphitheater is located in the center of the city park, and concerts can be seen and heard by those using the park.  The organization has scheduled the concert for a Saturday afternoon in the summer.  Some argue the concert constitutes a disturbance of the peace, and should be cancelled due to its offensive nature.  Others in the community think the concert is protected as free speech, and should be allowed to proceed.",
    "A large oil company is proposing to begin off-shore drilling operations near a popular bay.  The company believes there are large, untapped reserves of oil beneath the sea floor.  An oil refinery employs many local residents.  The proposed drilling operations would occur ten miles off-shore.  The beaches around the bay are popular tourist destinations.  Swimming, fishing, and boating are common in the bay, which is known for its seafood.  Some local residents believe the drilling operations would boost the economy and provide more jobs.  Others in the community fear such drilling would be harmful to sea life and the local environment.",
    "The U.S. State department is considering sending military troops to a foreign nation.  This nation has been in the midst of an extended civil war, which has claimed many lives.  Many residents of the nation have become displaced due to the conflict.  If sent, the troops would provide military support to local rebel militias.  The local militias have been fighting against the ruling government forces during the conflict.  Those who support sending troops argue it is a humanitarian crisis and we have a responsibility to send support.  Those who oppose sending troops argue it is not our place to interfere, and it would constitute unnecessary military overreach."
]

Chain.destroy_all
Passage.destroy_all

for j in 1...31 do
    Chain.new(identifier: 'M' + j.to_s).save!
    Chain.new(identifier: 'L' + j.to_s).save!
end

i = 0
texts.each do |passage|
    Chain.all.each do |chain|
        chain.passages.create!(chain_id: chain.id, number: i, text: passage, derivation: 0, time_spent: 0)
        chain.save!
    end
    i += 1
end
