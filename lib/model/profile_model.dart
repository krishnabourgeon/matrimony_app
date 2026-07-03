// Shared Profile model — single source of truth for all screens.

class Profile {
  final String name;
  final int age;
  final String profession;
  final String city;
  final String religion;
  final String caste;
  final String height;
  final String education;
  final int? matchPct;
  final String image;
  final bool verified;
  final bool premium;
  final bool assistedService;
  final String income;
  final String profileId;
  final String lastSeen;
  final int photoCount;
  final String about;
  final List<String> hobbies;
  bool liked;
  bool interested;
  bool shortlisted;

  Profile({
    required this.name,
    required this.age,
    required this.profession,
    required this.city,
    required this.religion,
    required this.caste,
    required this.height,
    required this.education,
     this.matchPct,
    required this.image,
    this.verified = true,
    this.premium = false,
    this.assistedService = false,
    this.income = '',
    this.profileId = '',
    this.lastSeen = '',
    this.photoCount = 1,
    this.about = '',
    this.hobbies = const [],
    this.liked = false,
    this.interested = false,
    this.shortlisted = false,
  });
}

final List<Profile> appProfiles = [
  Profile(
    name: 'Krishna S',
    age: 27,
    profession: 'Software Engineer',
    city: 'Bengaluru',
    religion: 'Hindu',
    caste: 'Nair',
    height: "5'4\"",
    education: 'B.Tech – Computer Science',
    matchPct: 96,
    image: 'assets/image/image 10.png',
    verified: true,
    premium: true,
    income: '₹ 8 - 10 lakhs',
    profileId: 'E7512344',
    lastSeen: 'Last seen today',
    photoCount: 4,
    about:
        'Software engineer who loves travelling and reading. Looking for a life partner who shares similar values and is family-oriented.',
    hobbies: ['Travelling', 'Reading', 'Music', 'Yoga'],
  ),
  Profile(
    name: 'Divya Menon',
    age: 25,
    profession: 'Doctor (MBBS)',
    city: 'Kochi',
    religion: 'Hindu',
    caste: 'Ezhava',
    height: "5'2\"",
    education: 'MBBS – Medical College Kochi',
    matchPct: 93,
    image: 'assets/image/riys.png',
    verified: true,
    premium: false,
    assistedService: false,
    income: '₹ 12 - 15 lakhs',
    profileId: 'E7498211',
    lastSeen: 'Last seen yesterday',
    photoCount: 2,
    about:
        'Passionate doctor, family-oriented, loves cooking traditional Kerala food and gardening in spare time.',
    hobbies: ['Cooking', 'Gardening', 'Cinema', 'Reading'],
  ),
  Profile(
    name: 'Meenakshi Pillai',
    age: 29,
    profession: 'IAS Officer',
    city: 'Thiruvananthapuram',
    religion: 'Hindu',
    caste: 'Brahmin',
    height: "5'5\"",
    education: 'MSc – Political Science',
    matchPct: 91,
    image: 'assets/image/priya.png',
    verified: true,
    premium: true,
    assistedService: true,
    income: '₹ 18 - 22 lakhs',
    profileId: 'E7435691',
    lastSeen: 'Last seen 2 days ago',
    photoCount: 5,
    about:
        'IAS officer, disciplined and family-oriented. Enjoy classical music and literature in free time.',
    hobbies: ['Music', 'Writing', 'Travelling', 'Chess'],
  ),
  Profile(
    name: 'Lakshmi Varma',
    age: 26,
    profession: 'Chartered Accountant',
    city: 'Thrissur',
    religion: 'Hindu',
    caste: 'Nair',
    height: "5'3\"",
    education: 'CA – ICAI',
    matchPct: 89,
    image: 'assets/image/archana.png',
    verified: true,
    premium: false,
    income: '₹ 10 - 12 lakhs',
    profileId: 'E7421098',
    lastSeen: 'Last seen 3 days ago',
    photoCount: 3,
    about:
        'CA by profession, love cooking and spending quality time with family. Looking for a sincere and caring partner.',
    hobbies: ['Cooking', 'Dancing', 'Badminton', 'Yoga'],
  ),
  Profile(
    name: 'Sneha Krishna',
    age: 28,
    profession: 'Architect',
    city: 'Mumbai',
    religion: 'Hindu',
    caste: 'Kshatriya',
    height: "5'6\"",
    education: 'B.Arch – Mumbai University',
    matchPct: 87,
    image: 'https://randomuser.me/api/portraits/women/79.jpg',
    verified: false,
    premium: false,
    income: '₹ 8 - 10 lakhs',
    profileId: 'E7380034',
    lastSeen: 'Last seen a week ago',
    photoCount: 6,
    about:
        'Creative architect with a flair for design and art. Love exploring new places and experimenting with food.',
    hobbies: ['Painting', 'Travelling', 'Photography', 'Cinema'],
  ),
  Profile(
    name: 'Kavya Suresh',
    age: 24,
    profession: 'MBA – Finance',
    city: 'Pune',
    religion: 'Hindu',
    caste: 'Nair',
    height: "5'3\"",
    education: 'MBA – Symbiosis Pune',
    matchPct: 85,
    image: 'https://randomuser.me/api/portraits/women/90.jpg',
    verified: true,
    premium: true,
    income: '₹ 6 - 8 lakhs',
    profileId: 'E7345567',
    lastSeen: 'Last seen today',
    photoCount: 3,
    about:
        'Finance professional, loves trekking and adventure. Believes in simplicity and honest relationships.',
    hobbies: ['Trekking', 'Reading', 'Swimming', 'Gaming'],
  ),
];

// Legacy alias — kept so UserDetailScreen compiles unchanged.
typedef UserProfile = Profile;
final List<UserProfile> userProfiles = appProfiles;
