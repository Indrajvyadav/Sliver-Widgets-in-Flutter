class Image1 {
  Image1({
    required this.img,
    required this.body,
    required this.title,
  });
  final String img;
  final String body;
  final String title;
}

List<Image1> images = [
  Image1(
      img: 'assets/images/demon.jpg',
      body:
          'In Taishō era Japan, a secret organization known as the "Demon Slayer Corps" has waged a war against demons for centuries. Demons are former humans who possess supernatural abilities such as enhanced strength, rapid regeneration, and unique powers referred to as "Blood Demon Arts". Demons can only be killed if they are exposed to direct sunlight, decapitated with weapons crafted from an alloy called Nichirin, or injected with a poison extracted from wisteria flowers,In contrast, the Demon Slayers are entirely human but employ specialized elemental breathing techniques known as Breathing Styles. These techniques grant them superhuman strength, heightened abilities, and increased resilience that enable them to fight demons effectively. The most formidable Demon Slayers are known as the Hashira and gain this title through multiple advancements in the Corps ranks, culminating in killing fifty demons at the highest level or a member of the Twelve Kizuki.',
      title: 'Demon Slayer'),
  Image1(
      img: 'assets/images/attack.jpg',
      body:
          'The story of Attack on Titan centers on a civilization inside three circular walls. According to the knowledge propagated locally, it is the last surviving vestige of human civilization. Its inhabitants, known as Eldians, have been led to believe that over one hundred years ago, humanity was driven to the brink of extinction after the emergence of humanoid giants called Titans, who attack and eat humans on sight. The last remnants of humanity retreated behind three concentric walls and enjoyed roughly a century of peace. Within the walls, the thought of venturing outside is strongly frowned upon and discouraged. To combat Titans, the countrys military employs Vertical Maneuvering Equipment (VME), also called Omni-Directional Maneuvering Gear (ODM Gear): a set of waist-mounted grappling hooks and gas-powered propulsion enabling mobility in three dimensions. Swords made of ultrahard steel are used in conjunction with the gear, and eventually rocket launcher-like weapons called Thunder Spears are developed.',
      title: 'Attack on Titan')
];
