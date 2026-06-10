const needs = [
  { id: "hygiene", label: "Hygiene critical", hint: "Easy-to-clean belts, wide hinges, washdown-oriented parts." },
  { id: "wetSticky", label: "Wet or sticky product", hint: "Release surfaces, no-cling profiles, reduced adhesion." },
  { id: "drainage", label: "Drainage or air flow", hint: "Open-area belt surfaces and draining profiles." },
  { id: "dryContact", label: "Stable dry contact", hint: "Closed flat top surfaces for steady product support." },
  { id: "grip", label: "Extra product grip", hint: "Nub or cone surfaces for release and traction." },
  { id: "incline", label: "Steep incline", hint: "Profiles and buckets to carry product upward." },
  { id: "bulk", label: "Bulk retention", hint: "Side guards, bucket profiles, and containment accessories." },
  { id: "accumulation", label: "Low back pressure", hint: "Rollers for accumulation or product separation." },
  { id: "metalDetect", label: "Metal detectable", hint: "MD material options where listed in the brochure." },
  { id: "cold", label: "Cold operation", hint: "PE and other materials with low-temperature ranges." },
  { id: "hot", label: "Hot operation", hint: "PP, PA, PLX, or other higher-temperature options." },
  { id: "quickService", label: "Fast belt access", hint: "Quick-release or simpler maintenance accessories." }
];

const seriesCatalog = [
  {
    id: "all",
    label: "All Prolink products",
    family: "Siegling Prolink product range",
    title: "Product range - Modular belt series",
    pitch: "Straight running, side-flexing, and spiral belts",
    description: "Browse the full Prolink modular belt range by product series, pitch, opening area, surface type, application fit, and reference source. Switch to a specific series for a focused selling flow.",
    source: "Product Range PDF Ref. no. 800-2; Engineering Manual PDF Ref. no. 888",
    cover: "assets/range/range-01.png"
  },
  {
    id: "s1",
    label: "Series 1",
    family: "Straight running belts",
    title: "Series 1 - Industrial conveying",
    pitch: "Pitch 50 mm (1.97 in)",
    description: "Medium to heavy-duty industrial conveying belt with closed hinge design, high belt pull capacity, rigid modules, and closed solid edges.",
    source: "Product Range page 16; Engineering Manual pages 25-32",
    cover: "assets/range/range-16.png"
  },
  {
    id: "s2",
    label: "Series 2",
    family: "Straight running belts",
    title: "Series 2 - Light-duty food and container handling",
    pitch: "Pitch 25 mm (0.98 in)",
    description: "Light-duty food, container handling, and industrial belt with open hinge design and low belt weight.",
    source: "Product Range page 16; Engineering Manual pages 39-44",
    cover: "assets/range/range-16.png"
  },
  {
    id: "s41",
    label: "Series 4.1",
    family: "Straight running belts",
    title: "Series 4.1 - Small transfer applications",
    pitch: "Pitch 14 mm (0.55 in)",
    description: "Light to medium-duty food and non-food belt with small pitch for tight transfer gaps and easy-clean underside channels.",
    source: "Product Range page 17; Engineering Manual pages 51-56",
    cover: "assets/range/range-17.png"
  },
  {
    id: "s5",
    label: "Series 5",
    family: "Side flexing and spiral belts",
    title: "Series 5 - Radius and spiral conveying",
    pitch: "Pitch 25 mm (0.98 in), Cc = 2.0",
    description: "Light to medium-duty side-flexing belt with up to 45% open area, stainless steel hinge pins, guided/reinforced variants, and strong radius performance.",
    source: "Product Range pages 12 and 22; Engineering Manual pages 61-68",
    cover: "assets/range/range-22.png"
  },
  {
    id: "s61",
    label: "Series 6.1",
    family: "Siegling Prolink modular belts",
    title: "Series 6.1 - Straight running belts",
    pitch: "Pitch 50 mm (1.97 in)",
    description: "Medium to heavy-duty, hygiene-critical modular belting with easy-clean hinges, multiple open-area surfaces, profiles, side guards, sprockets, ProSnap, hold-down tabs, and roller options.",
    source: "Prolink Engineering Manual excerpt 08/2025, Ref-No. 888",
    cover: "assets/pages/page-01.png"
  },
  {
    id: "s7",
    label: "Series 7",
    family: "Straight running belts",
    title: "Series 7 - Heavy-duty non-food applications",
    pitch: "Pitch 40 mm (1.57 in)",
    description: "Heavy-duty belt with closed hinge design, high pull strength, robust contact area, and flame-retardant options.",
    source: "Product Range page 18; Engineering Manual pages 105-111",
    cover: "assets/range/range-18.png"
  },
  {
    id: "s81",
    label: "Series 8 / 8.1",
    family: "Straight running belts",
    title: "Series 8 / 8.1 - Medium to heavy-duty industrial",
    pitch: "Pitch 25.4 mm (1 in)",
    description: "Medium to heavy-duty closed-hinge belt family with robust module and sprocket design for long industrial conveyors.",
    source: "Product Range pages 9 and 18; Engineering Manual pages 117-124",
    cover: "assets/range/range-18.png"
  },
  {
    id: "s10",
    label: "Series 10",
    family: "Straight running belts",
    title: "Series 10 - Hygiene-sensitive products",
    pitch: "Pitch 25.4 mm (1 in)",
    description: "Light to medium-duty hygiene-critical belt with easy-clean eyelets, continuous drive bar, and ProSnap/accessory options.",
    source: "Product Range page 19; Engineering Manual pages 155-161",
    cover: "assets/range/range-19.png"
  },
  {
    id: "s13",
    label: "Series 13",
    family: "Straight running belts",
    title: "Series 13 - Micro pitch nose bar",
    pitch: "Pitch 8 mm (0.31 in)",
    description: "Light-duty micro pitch belt for food and non-food tight-transfer nose bar applications.",
    source: "Product Range pages 7 and 19; Engineering Manual pages 179-183",
    cover: "assets/range/range-19.png"
  },
  {
    id: "s14",
    label: "Series 14",
    family: "Straight running belts",
    title: "Series 14 - Mini pitch transfer belt",
    pitch: "Pitch 12.7 mm (0.5 in)",
    description: "Medium-duty small-pitch belt for food and non-food use, optimized for nose bars and tight product transfers.",
    source: "Product Range pages 7 and 20; Engineering Manual pages 187-191",
    cover: "assets/range/range-20.png"
  },
  {
    id: "s15",
    label: "Series 15",
    family: "Straight running belts",
    title: "Series 15 - Open mini pitch food belt",
    pitch: "Pitch 12.7 mm (0.5 in)",
    description: "Light-duty food belt for 12.7 mm nose bars with large open area for airflow and drainage.",
    source: "Product Range pages 7, 8, and 20; Engineering Manual pages 197-199",
    cover: "assets/range/range-20.png"
  },
  {
    id: "s17",
    label: "Series 17",
    family: "Straight running belts",
    title: "Series 17 - Medium to heavy-duty industrial",
    pitch: "Pitch 25.4 mm (1 in)",
    description: "Medium to heavy-duty closed-hinge belt with rigid module design and keyhole pin retention.",
    source: "Product Range pages 9 and 21; Engineering Manual pages 203-205",
    cover: "assets/range/range-21.png"
  },
  {
    id: "s9",
    label: "Series 9",
    family: "Side flexing and spiral belts",
    title: "Series 9 - Heavy-duty radius belt",
    pitch: "Pitch 50 mm (1.97 in), Cc = 1.8",
    description: "Medium to heavy-duty side-flexing belt with 57% open area and stainless steel hinge pins for high load capacity and lateral stiffness.",
    source: "Product Range pages 13 and 22; Engineering Manual pages 135-140",
    cover: "assets/range/range-22.png"
  },
  {
    id: "s91",
    label: "Series 9.1",
    family: "Side flexing and spiral belts",
    title: "Series 9.1 - Spiral tower belt",
    pitch: "Pitch 50 mm (1.97 in), Cc = 1.3-2.9",
    description: "Medium to heavy-duty spiral belt with clip-free hinge pins, strong side modules, and adjustable collapse factor.",
    source: "Product Range pages 13 and 23; Engineering Manual pages 147-148",
    cover: "assets/range/range-23.png"
  },
  {
    id: "s11",
    label: "Series 11",
    family: "Side flexing and spiral belts",
    title: "Series 11 - Tight radius lightweight belt",
    pitch: "Pitch 25 mm (0.98 in), Cc = 1.4",
    description: "Light-duty all-plastic side-flexing belt with 45% open area and tight minimum curve radius.",
    source: "Product Range pages 12 and 23; Engineering Manual pages 169-172",
    cover: "assets/range/range-23.png"
  },
  {
    id: "s18",
    label: "Series 18",
    family: "Side flexing and spiral belts",
    title: "Series 18 - All-plastic side-flexing belt",
    pitch: "Pitch 25.4 mm (1 in), Cc = 1.7 / 2.2",
    description: "Light to medium-duty all-plastic belt with 44% open grid structure, high curve belt pull capacity, and direct food contact suitability.",
    source: "Product Range pages 10, 12, and 24; Engineering Manual pages 209-214",
    cover: "assets/range/range-24.png"
  }
];

const products = [
  {
    id: "s61-overview",
    title: "Series 6.1 Overview",
    category: "Guide",
    opening: "0-36%",
    bestFit: "Start here for general hygiene-critical, medium to heavy-duty applications.",
    description: "Straight running modular belts with 50 mm pitch, minimum 40 mm width, 20 mm width increments, wide modules, open hinges, easy-clean underside channels, and accessory options.",
    materials: "PE, POM, POM-CR, PP, MD materials, PA, TPC1, PLX by belt type",
    temperature: "Material dependent",
    page: 2,
    image: "assets/products/product-02.png",
    tags: ["hygiene", "dryContact", "drainage", "bulk", "quickService"],
    notes: "Use this as the conversation anchor before choosing a specific surface or accessory."
  },
  {
    id: "s61-0-flt",
    title: "S6.1-0 FLT",
    category: "Belt surface",
    opening: "0%",
    bestFit: "Dry products needing stable support and a smooth closed surface.",
    description: "Closed smooth flat top surface with easy-to-clean construction and cut-resistant options depending on material.",
    materials: "PE, POM, POM-CR, PP, PE-MD, POM-MD, PP-MD; mold-to-order PA, TPC1, PLX",
    temperature: "-70/65 C PE, -45/90 C POM, 5/100 C PP, up to 120 C in selected mold-to-order materials",
    page: 3,
    image: "assets/products/product-03.png",
    tags: ["hygiene", "dryContact", "metalDetect", "cold", "hot"],
    notes: "Nominal belt pull examples: 13 N/mm PE, 30 N/mm POM/POM-CR, 18 N/mm PP."
  },
  {
    id: "s61-0-ntp",
    title: "S6.1-0 NTP",
    category: "Belt surface",
    opening: "0%",
    bestFit: "Wet or sticky products that need better release from a closed belt.",
    description: "Closed nub top surface with round studs, 6% contact area, molded indent option, and easy-to-clean construction.",
    materials: "PE white/light blue, POM light blue; mold-to-order PP",
    temperature: "-70/65 C PE, -45/90 C POM, 5/100 C PP",
    page: 4,
    image: "assets/products/product-04.png",
    tags: ["hygiene", "wetSticky", "grip", "cold", "hot"],
    notes: "Good release surface for wet and sticky product contact."
  },
  {
    id: "s61-0-ctp",
    title: "S6.1-0 CTP",
    category: "Belt surface",
    opening: "0%",
    bestFit: "Closed surface applications needing superior grip.",
    description: "Cone top surface with pointed studs for added grip while retaining easy-to-clean features.",
    materials: "POM white standard; mold-to-order PE",
    temperature: "-45/90 C POM, -70/65 C PE mold-to-order",
    page: 5,
    image: "assets/products/product-05.png",
    tags: ["hygiene", "grip", "wetSticky", "cold"],
    notes: "Mold-to-width available in 400 mm."
  },
  {
    id: "s61-21-flt",
    title: "S6.1-21 FLT",
    category: "Belt surface",
    opening: "21%",
    bestFit: "Moderate drainage and air circulation while keeping broad product support.",
    description: "Open area flat top belt with 21% opening, 72% contact area, and largest opening around 1.9 x 11 mm.",
    materials: "PE, POM, PP; mold-to-order PLX",
    temperature: "-70/65 C PE, -45/90 C POM, 5/100 C PP, -45/120 C PLX",
    page: 6,
    image: "assets/products/product-06.png",
    tags: ["hygiene", "drainage", "cold", "hot", "dryContact"],
    notes: "A balanced open surface when drainage is needed without very large openings."
  },
  {
    id: "s61-23-flt",
    title: "S6.1-23 FLT",
    category: "Belt surface",
    opening: "23%",
    bestFit: "Drainage and air circulation with a smooth flat top surface.",
    description: "Open area flat top belt with 23% opening and 71% contact area.",
    materials: "PE, POM, PP; mold-to-order PE-MD, POM-CR, PE-I, PLX",
    temperature: "-70/65 C PE, -45/90 C POM, 5/100 C PP, -45/120 C PLX",
    page: 7,
    image: "assets/products/product-07.png",
    tags: ["hygiene", "drainage", "metalDetect", "cold", "hot", "dryContact"],
    notes: "Often a strong recommendation when the customer needs drainage with standard material breadth."
  },
  {
    id: "s61-36-flt",
    title: "S6.1-36 FLT",
    category: "Belt surface",
    opening: "36%",
    bestFit: "Maximum drainage or air flow in the Series 6.1 surface set.",
    description: "Large open-area flat top belt with 36% opening, 35% contact area, and largest opening around 12 mm diameter.",
    materials: "PE, POM, PP; mold-to-order PP-MD, PE-MD, POM-MD, PLX",
    temperature: "-70/65 C PE, -45/90 C POM, 5/100 C PP, -45/120 C PLX",
    page: 8,
    image: "assets/products/product-08.png",
    tags: ["hygiene", "drainage", "metalDetect", "cold", "hot"],
    notes: "Brochure warning: personnel should not place fingers in or on this belt because of very large openings."
  },
  {
    id: "s61-prosnap",
    title: "S6.1-0 FLT PSP ProSnap",
    category: "Service",
    opening: "0%",
    bestFit: "Customers who need quick, toolless belt opening and closing.",
    description: "Quick-release solution with one pin solution for the entire belt width.",
    materials: "POM blue module with stainless steel pin; POM-MD mold-to-order",
    temperature: "Accessory may affect design radii",
    page: 9,
    image: "assets/products/product-09.png",
    tags: ["quickService", "hygiene", "metalDetect"],
    notes: "Pin length listed up to 3000 mm."
  },
  {
    id: "s61-sprockets",
    title: "S6.1 SPR Sprockets",
    category: "Drive",
    opening: "N/A",
    bestFit: "Drive selection for Series 6.1 belts with enhanced tooth engagement.",
    description: "Easy-to-clean sprocket design in Z6, Z8 V2, Z10 V2, Z12 V2, and Z16 V2 sizes with round or square bore options.",
    materials: "PA light gray",
    temperature: "See sprocket and shaft dimensions",
    page: 10,
    image: "assets/products/product-10.png",
    tags: ["hygiene", "quickService"],
    notes: "Use when confirming drive layout, bore size, and sprocket spacing."
  },
  {
    id: "s61-profile-pmu",
    title: "S6.1-0 FLT PMU",
    category: "Profile",
    opening: "0%",
    bestFit: "Dry products on inclines where raised profiles are needed.",
    description: "Flat top profile modules available in 50, 100, and 150 mm heights depending on material, with standard and indent configurations.",
    materials: "PE, POM-CR, POM, POM-MD, PP, PP-MD",
    temperature: "Material dependent",
    page: 11,
    image: "assets/products/product-11.png",
    tags: ["incline", "dryContact", "bulk", "metalDetect"],
    notes: "Molded width: 200 mm."
  },
  {
    id: "s61-ncl-pmu",
    title: "S6.1-0 NCL PMU",
    category: "Profile",
    opening: "0%",
    bestFit: "Incline conveying for wet and sticky products needing better release.",
    description: "No-cling profile with nub top base to improve release of wet and sticky products.",
    materials: "PE light blue or white",
    temperature: "PE material range",
    page: 12,
    image: "assets/products/product-12.png",
    tags: ["incline", "wetSticky", "grip", "bulk"],
    notes: "Height listed at 100 mm."
  },
  {
    id: "s61-23-ncl-pmu",
    title: "S6.1-23 NCL PMU",
    category: "Profile",
    opening: "23%",
    bestFit: "Wet, sticky, or draining incline applications.",
    description: "No-cling profile with 23% open-area base to improve release while supporting drainage.",
    materials: "PE and PP in light blue or white",
    temperature: "PE or PP material range",
    page: 13,
    image: "assets/products/product-13.png",
    tags: ["incline", "wetSticky", "drainage", "bulk", "hot"],
    notes: "Height listed at 100 mm."
  },
  {
    id: "s61-psu-0",
    title: "S6.1-0 FLT PSU-0",
    category: "Profile",
    opening: "0%",
    bestFit: "Steep incline conveyors carrying bulk product.",
    description: "Scooped profiles with a closed flat top surface for steep incline conveyors.",
    materials: "PE, POM, PP in light blue or white; PP-MD blue in selected heights",
    temperature: "Material dependent",
    page: 14,
    image: "assets/products/product-14.png",
    tags: ["incline", "bulk", "dryContact", "metalDetect"],
    notes: "Heights include 76, 102, and 152 mm depending on material."
  },
  {
    id: "s61-psu-16",
    title: "S6.1-0 FLT PSU-16",
    category: "Profile",
    opening: "16%",
    bestFit: "Steep incline conveying where drainage through the profile matters.",
    description: "Scooped profiles with 16% open area and a flat top surface for drainage on steep inclines.",
    materials: "PE, POM, PP in light blue or white",
    temperature: "Material dependent",
    page: 15,
    image: "assets/products/product-15.png",
    tags: ["incline", "bulk", "drainage", "hot"],
    notes: "Heights include 102 and 152 mm."
  },
  {
    id: "s61-bpu",
    title: "S6.1-0 FLT BPU",
    category: "Profile",
    opening: "0%",
    bestFit: "Contained conveying of bulk products up steep inclines.",
    description: "Bucket profiles for contained conveying of bulk products up steep inclines.",
    materials: "PE, POM, PP in light blue or white",
    temperature: "Material dependent",
    page: 16,
    image: "assets/products/product-16.png",
    tags: ["incline", "bulk", "dryContact"],
    notes: "Heights include 102 and 152 mm."
  },
  {
    id: "s61-side-guards",
    title: "S6.1 SG Side Guards",
    category: "Accessory",
    opening: "N/A",
    bestFit: "Retention of loose or bulk products along the belt edge.",
    description: "Side guards for retention of bulk products, with multiple heights and recommended running direction.",
    materials: "PE, PE-MD, PP in light blue, white, or blue",
    temperature: "Material dependent",
    page: 17,
    image: "assets/products/product-17.png",
    tags: ["bulk", "incline", "metalDetect"],
    notes: "Heights include 25, 50, 75, and 100 mm depending on material."
  },
  {
    id: "s61-hdt",
    title: "S6.1 HDT Hold Down Tabs",
    category: "Accessory",
    opening: "N/A",
    bestFit: "Wider belts, lift prevention, and swan neck conveyor guidance.",
    description: "Hold down tabs molded on a narrow module to improve strength, stability, and cleanability.",
    materials: "POM light blue or white",
    temperature: "Accessory may affect design radii",
    page: 18,
    image: "assets/products/product-18.png",
    tags: ["hygiene", "incline", "quickService"],
    notes: "Check sprocket and shaft clearance constraints when using HDT."
  },
  {
    id: "s61-prr",
    title: "S6.1 PRR Pin Retained Rollers",
    category: "Accessory",
    opening: "N/A",
    bestFit: "Low back pressure accumulation or product separation.",
    description: "Pin retained rollers for applications where low back pressure accumulation or product separation is required.",
    materials: "Rollers available in POM black; works with all materials and surfaces",
    temperature: "Belt material dependent",
    page: 19,
    image: "assets/products/product-19.png",
    tags: ["accumulation", "quickService"],
    notes: "Sprockets must not be placed inline with rollers."
  }
];

products.push(
  {
    id: "s1-range",
    seriesId: "s1",
    title: "Series 1 Product Range",
    category: "Series overview",
    opening: "0-18%",
    bestFit: "Medium to heavy-duty industrial conveying with high pull capacity and closed hinge construction.",
    description: "Available surfaces include S1-0 FLT, S1-0 SRS, S1-18 FLT, S1-0 NSK, and S1-0 FRT1. Sprockets, profiles, and side guards are available.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 16,
    sourceImage: "assets/range/range-16.png",
    image: "assets/range/range-16.png",
    tags: ["dryContact", "grip", "bulk", "incline", "hot"],
    notes: "Product Range page 16. Engineering Manual pages 25-32."
  },
  {
    id: "s2-range",
    seriesId: "s2",
    title: "Series 2 Product Range",
    category: "Series overview",
    opening: "0-57%",
    bestFit: "Light-duty food, container handling, and industrial applications where drainage and low belt weight matter.",
    description: "Available surfaces include S2-0 FLT, S2-12 FLT, S2-57 GRT, S2-57 RRB, and S2-0 FRT1. Sprockets, profiles, side guards, and finger plates are available.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 16,
    sourceImage: "assets/range/range-16.png",
    image: "assets/range/range-16.png",
    tags: ["hygiene", "drainage", "dryContact", "grip", "quickService"],
    notes: "Product Range page 16. Engineering Manual pages 39-44."
  },
  {
    id: "s41-range",
    seriesId: "s41",
    title: "Series 4.1 Product Range",
    category: "Series overview",
    opening: "0-21%",
    bestFit: "Small transfer gaps in light to medium-duty food and non-food applications.",
    description: "Available surfaces include S4.1-0 FLT, S4.1-0 NPY, S4.1-0 FRT1, S4.1-21 FLT, and S4.1-21 NTP. Sprockets, profiles, and ProSnap are available.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 17,
    sourceImage: "assets/range/range-17.png",
    image: "assets/range/range-17.png",
    tags: ["hygiene", "drainage", "wetSticky", "grip", "quickService"],
    notes: "Product Range page 17. Engineering Manual pages 51-56."
  },
  {
    id: "s7-range",
    seriesId: "s7",
    title: "Series 7 Product Range",
    category: "Series overview",
    opening: "0-6%",
    bestFit: "Heavy loads and industrial conveyors needing high strength and durability.",
    description: "Available surfaces include S7-0 FLT, S7-0 SRS, S7-6 FLT, S7-0 NSK, S7-6 NSK, and S7-0 FRT1. Sprockets and wheelstoppers are available.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 18,
    sourceImage: "assets/range/range-18.png",
    image: "assets/range/range-18.png",
    tags: ["dryContact", "grip", "hot"],
    notes: "Product Range page 18. Engineering Manual pages 105-111."
  },
  {
    id: "s81-range",
    seriesId: "s81",
    title: "Series 8 / 8.1 Product Range",
    category: "Series overview",
    opening: "0-30%",
    bestFit: "Medium to heavy-duty industrial conveying, long conveyors, and robust closed-hinge applications.",
    description: "Available surfaces include flat top, slip-resistant, non-skid, radius top, 30% open flat top, friction top, roller top, and PRR variants.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 18,
    sourceImage: "assets/range/range-18.png",
    image: "assets/range/range-18.png",
    tags: ["dryContact", "grip", "drainage", "accumulation", "bulk"],
    notes: "Product Range pages 9 and 18. Engineering Manual pages 117-124."
  },
  {
    id: "s10-range",
    seriesId: "s10",
    title: "Series 10 Product Range",
    category: "Series overview",
    opening: "0-36%",
    bestFit: "Light to medium-duty hygiene-sensitive products where easy cleaning and safe tracking are important.",
    description: "Available surfaces include S10-0 FLT, S10-0 NTP, S10-0 FRT1, S10-22 FLT, S10-36 LRB, and S10-36 FLT. Sprockets, profiles, side guards, hold-down tabs, and ProSnap are available.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 19,
    sourceImage: "assets/range/range-19.png",
    image: "assets/range/range-19.png",
    tags: ["hygiene", "drainage", "wetSticky", "grip", "quickService"],
    notes: "Product Range page 19. Engineering Manual pages 155-161."
  },
  {
    id: "s13-range",
    seriesId: "s13",
    title: "Series 13 Product Range",
    category: "Series overview",
    opening: "0-34%",
    bestFit: "Micro-pitch nose bar transfer for light-duty food and non-food use.",
    description: "Available surfaces include flat top, negative pyramid, cone top, and 34% open flat top variants.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 19,
    sourceImage: "assets/range/range-19.png",
    image: "assets/range/range-19.png",
    tags: ["hygiene", "dryContact", "drainage", "grip", "quickService"],
    notes: "Product Range pages 7 and 19. Engineering Manual pages 179-183."
  },
  {
    id: "s14-range",
    seriesId: "s14",
    title: "Series 14 Product Range",
    category: "Series overview",
    opening: "0-25%",
    bestFit: "Small transfer gaps and mini-pitch food/non-food conveying with nose bar compatibility.",
    description: "Available surfaces include S14-0 FLT, S14-25 FLT, S14-25 CUT, and S14-25 FRT1. Sprockets and profiles are available.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 20,
    sourceImage: "assets/range/range-20.png",
    image: "assets/range/range-20.png",
    tags: ["hygiene", "drainage", "dryContact", "grip", "quickService"],
    notes: "Product Range pages 7 and 20. Engineering Manual pages 187-191."
  },
  {
    id: "s15-range",
    seriesId: "s15",
    title: "Series 15 Product Range",
    category: "Series overview",
    opening: "47%",
    bestFit: "Light-duty food applications needing open mini-pitch airflow and transfer over 12.7 mm nose bars.",
    description: "Available surfaces include S15-47 GRT and S15-47 RSA reduced surface area.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 20,
    sourceImage: "assets/range/range-20.png",
    image: "assets/range/range-20.png",
    tags: ["hygiene", "drainage", "quickService"],
    notes: "Product Range pages 7, 8, and 20. Engineering Manual pages 197-199."
  },
  {
    id: "s17-range",
    seriesId: "s17",
    title: "Series 17 Product Range",
    category: "Series overview",
    opening: "0%",
    bestFit: "Medium to heavy-duty industrial applications needing rigid modules and easy pin removal.",
    description: "Available surfaces include S17-0 FLT and S17-0 SRS. Sprockets and profiles are available.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 21,
    sourceImage: "assets/range/range-21.png",
    image: "assets/range/range-21.png",
    tags: ["dryContact", "grip", "quickService"],
    notes: "Product Range pages 9 and 21. Engineering Manual pages 203-205."
  },
  {
    id: "s5-range",
    seriesId: "s5",
    title: "Series 5 Product Range",
    category: "Series overview",
    opening: "33-45%",
    bestFit: "Radius, spiral, cooling, draining, and side-flexing applications.",
    description: "Available surfaces include S5-45 GRT, S5-45 NTP, S5-39 FRT1, S5-33 FRT2, guided, reversed guided, and reinforced variants.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 22,
    sourceImage: "assets/range/range-22.png",
    image: "assets/range/range-22.png",
    tags: ["drainage", "wetSticky", "grip", "bulk", "hygiene"],
    notes: "Product Range pages 12 and 22. Engineering Manual pages 61-68."
  },
  {
    id: "s9-range",
    seriesId: "s9",
    title: "Series 9 Product Range",
    category: "Series overview",
    opening: "57%",
    bestFit: "Medium to heavy-duty radius and spiral conveying with high open area.",
    description: "Available surfaces include S9-57 GRT, S9-57 NTP, guided belts, and longer side modules.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 22,
    sourceImage: "assets/range/range-22.png",
    image: "assets/range/range-22.png",
    tags: ["drainage", "wetSticky", "bulk", "hygiene"],
    notes: "Product Range pages 13 and 22. Engineering Manual pages 135-140."
  },
  {
    id: "s91-range",
    seriesId: "s91",
    title: "Series 9.1 Product Range",
    category: "Series overview",
    opening: "57%",
    bestFit: "Spiral towers, cage drives, and adjustable-radius side-flexing systems.",
    description: "Available surfaces include S9.1-57 GRT SMU and S9.1-57 GRT SMT for adjustable collapse factor layouts.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 23,
    sourceImage: "assets/range/range-23.png",
    image: "assets/range/range-23.png",
    tags: ["drainage", "bulk", "hygiene"],
    notes: "Product Range pages 13 and 23. Engineering Manual pages 147-148."
  },
  {
    id: "s11-range",
    seriesId: "s11",
    title: "Series 11 Product Range",
    category: "Series overview",
    opening: "33-45%",
    bestFit: "Lightweight tight-radius conveying with all-plastic construction.",
    description: "Available surfaces include S11-45 GRT, S11-45 GRT HD, and S11-33 FRT2.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 23,
    sourceImage: "assets/range/range-23.png",
    image: "assets/range/range-23.png",
    tags: ["drainage", "grip", "bulk", "hygiene"],
    notes: "Product Range pages 12 and 23. Engineering Manual pages 169-172."
  },
  {
    id: "s18-range",
    seriesId: "s18",
    title: "Series 18 Product Range",
    category: "Series overview",
    opening: "44%",
    bestFit: "All-plastic side-flexing food and non-food applications with high curve belt pull.",
    description: "Available surfaces include S18-44 GRT 2.2, guided, high deck, friction top, and 1.7/2.2 variants.",
    materials: "Material selection referenced from product range material guide and engineering manual.",
    temperature: "Material dependent",
    page: 24,
    sourceImage: "assets/range/range-24.png",
    image: "assets/range/range-24.png",
    tags: ["hygiene", "drainage", "grip", "bulk"],
    notes: "Product Range pages 10, 12, and 24. Engineering Manual pages 209-214."
  }
);

const materialOrder = ["POM-CR", "POM-HC", "POM-MD", "PP-MD", "PP-SW", "PE-MD", "PE-I", "PXX-HC", "PA-HT", "TPC1", "PLX", "POM", "PBT", "PE", "PP", "PA", "SS", "R2"];
const colorCodes = [
  ["AT", "Anthracite"],
  ["BG", "Beige"],
  ["BK", "Black"],
  ["WT", "White"],
  ["LB", "Light blue"],
  ["BL", "Blue"],
  ["UC", "Uncolored"],
  ["LG", "Light gray"],
  ["DB", "Dark blue"],
  ["GN", "Green"],
  ["OR", "Orange"],
  ["RE", "Red"],
  ["TQ", "Turquoise"],
  ["YL", "Yellow"]
];

const rangeMaterials = ["PE", "PE-I", "PP", "POM", "POM-CR", "PA", "PA-HT", "PE-MD", "PP-MD", "PP-SW", "POM-MD", "POM-HC", "PXX-HC", "TPC1", "PLX"];
const rangeColors = ["White (WT)", "Light gray (LG)", "Black (BK)", "Light blue (LB)", "Blue (BL)", "Dark blue (DB)", "Uncolored (UC)", "Beige (BG)", "Orange (OR)"];

const brochureTraits = {
  "s61-overview": {
    colors: ["White (WT)", "Light blue (LB)", "Blue (BL)", "Uncolored (UC)", "Light gray (LG)", "Black (BK)"]
  },
  "s61-0-flt": {
    colors: ["White (WT)", "Light blue (LB)", "Blue (BL)", "Uncolored (UC)"]
  },
  "s61-0-ntp": {
    colors: ["White (WT)", "Light blue (LB)"]
  },
  "s61-0-ctp": {
    colors: ["White (WT)", "Uncolored (UC)"]
  },
  "s61-21-flt": {
    colors: ["White (WT)", "Light blue (LB)", "Uncolored (UC)"]
  },
  "s61-23-flt": {
    colors: ["White (WT)", "Light blue (LB)", "Blue (BL)", "Uncolored (UC)"]
  },
  "s61-36-flt": {
    colors: ["White (WT)", "Light blue (LB)", "Blue (BL)", "Uncolored (UC)"]
  },
  "s61-prosnap": {
    colors: ["Blue (BL)"]
  },
  "s61-sprockets": {
    colors: ["Light gray (LG)"],
    sizes: ["Z6", "Z8 V2", "Z10 V2", "Z12 V2", "Z16 V2"]
  },
  "s61-profile-pmu": {
    colors: ["White (WT)", "Light blue (LB)", "Blue (BL)"],
    sizes: ["50 mm", "100 mm", "150 mm"]
  },
  "s61-ncl-pmu": {
    colors: ["White (WT)", "Light blue (LB)"],
    sizes: ["100 mm"]
  },
  "s61-23-ncl-pmu": {
    colors: ["White (WT)", "Light blue (LB)"],
    sizes: ["100 mm"]
  },
  "s61-psu-0": {
    colors: ["White (WT)", "Light blue (LB)", "Blue (BL)"],
    sizes: ["76 mm", "102 mm", "152 mm"]
  },
  "s61-psu-16": {
    colors: ["White (WT)", "Light blue (LB)"],
    sizes: ["102 mm", "152 mm"]
  },
  "s61-bpu": {
    colors: ["White (WT)", "Light blue (LB)"],
    sizes: ["102 mm", "152 mm"]
  },
  "s61-side-guards": {
    colors: ["White (WT)", "Light blue (LB)", "Blue (BL)"],
    sizes: ["25 mm", "50 mm", "75 mm", "100 mm"]
  },
  "s61-hdt": {
    colors: ["White (WT)", "Light blue (LB)"]
  },
  "s61-prr": {
    colors: ["Black (BK)"]
  },
  "s1-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S1-0 FLT", "S1-0 SRS", "S1-18 FLT", "S1-0 NSK", "S1-0 FRT1"]
  },
  "s2-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S2-0 FLT", "S2-12 FLT", "S2-57 GRT", "S2-57 RRB", "S2-0 FRT1"]
  },
  "s41-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S4.1-0 FLT", "S4.1-0 NPY", "S4.1-0 FRT1", "S4.1-21 FLT", "S4.1-21 NTP"]
  },
  "s7-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S7-0 FLT", "S7-0 SRS", "S7-6 FLT", "S7-0 NSK", "S7-6 NSK", "S7-0 FRT1"]
  },
  "s81-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S8.1-0 FLT", "S8.1-0 SRS", "S8.1-0 NSK", "S8.1-25 RAT", "S8.1-30 FLT", "S8-0 FRT1", "S8-0 RTP A90", "S8.1-0 FLT PRR"]
  },
  "s10-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S10-0 FLT", "S10-0 NTP", "S10-0 FRT1", "S10-22 FLT", "S10-36 LRB", "S10-36 FLT"]
  },
  "s13-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S13-0 FLT", "S13-0 NPY", "S13-0 CTP", "S13-34 FLT"]
  },
  "s14-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S14-0 FLT", "S14-25 FLT", "S14-25 CUT", "S14-25 FRT1"]
  },
  "s15-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S15-47 GRT", "S15-47 RSA"]
  },
  "s17-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S17-0 FLT", "S17-0 SRS"]
  },
  "s5-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S5-45 GRT", "S5-45 NTP", "S5-39 FRT1", "S5-33 FRT2", "Guided", "Reversed guided", "Reinforced"]
  },
  "s9-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S9-57 GRT", "S9-57 NTP", "Guided", "Longer side modules"]
  },
  "s91-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S9.1-57 GRT SMU", "S9.1-57 GRT SMT"]
  },
  "s11-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S11-45 GRT", "S11-45 GRT HD", "S11-33 FRT2"]
  },
  "s18-range": {
    materials: rangeMaterials,
    colors: rangeColors,
    sizes: ["S18-44 GRT 2.2", "S18-44 GRT 2.2 G", "S18-44 HDK 2.2", "S18-44 FRT1 2.2", "S18-44 GRT 1.7"]
  }
};

Object.assign(brochureTraits, window.engineeringTraits || {});
products.push(...(window.engineeringProducts || []));
products.forEach((product) => {
  product.seriesId = product.seriesId || "s61";
});

let activeCategory = "All";
let activeSeries = "all";
const selectedNeeds = new Set();
const selectedConfigurations = [];
let configuringProductId = null;
let latestQuoteCalculation = null;
let authenticatedRep = null;

const needList = document.querySelector("#needList");
const productGrid = document.querySelector("#productGrid");
const categoryFilters = document.querySelector("#categoryFilters");
const seriesSelect = document.querySelector("#seriesSelect");
const seriesSummary = document.querySelector("#seriesSummary");
const searchInput = document.querySelector("#searchInput");
const selectionList = document.querySelector("#selectionList");
const compareBody = document.querySelector("#compareBody");
const quickStats = document.querySelector("#quickStats");
const needCount = document.querySelector("#needCount");
const selectionCount = document.querySelector("#selectionCount");
const dialog = document.querySelector("#productDialog");
const configureDialog = document.querySelector("#configureDialog");
const configureForm = document.querySelector("#configureForm");
const quoteAppDialog = document.querySelector("#quoteAppDialog");

function scoreProduct(product) {
  if (activeSeries !== "all" && product.seriesId !== activeSeries) return 0;
  if (!selectedNeeds.size) return 0;
  return product.tags.reduce((score, tag) => score + (selectedNeeds.has(tag) ? 1 : 0), 0);
}

function matchesSearch(product, query) {
  const haystack = [
    product.title,
    product.category,
    product.opening,
    product.bestFit,
    product.description,
    product.materials,
    product.notes,
    ...product.tags
  ].join(" ").toLowerCase();
  return haystack.includes(query.toLowerCase());
}

function getTraitOptions(product) {
  const brochure = brochureTraits[product.id] || {};
  const source = `${product.materials} ${product.description} ${product.notes}`;
  const materials = materialOrder.filter((material) => new RegExp(`(^|[^A-Z0-9-])${material.replace("-", "\\-")}([^A-Z0-9-]|$)`).test(source));
  const inferredColors = colorCodes.filter(([code, label]) => {
    const phrase = label.toLowerCase();
    return source.includes(code) || source.toLowerCase().includes(phrase);
  }).map(([, label]) => label);

  let sizes = brochure.sizes ? [...brochure.sizes] : [];
  const heightMatch = source.match(/Heights? (?:include|listed at) ([^.]+)/i);
  if (!sizes.length && heightMatch) {
    sizes = [...heightMatch[1].matchAll(/\d+\s?mm/g)].map((match) => match[0].replace(/\s/g, " "));
  }
  if (!sizes.length && product.id === "s61-sprockets") sizes = ["Z6", "Z8 V2", "Z10 V2", "Z12 V2", "Z16 V2"];
  if (product.id === "s61-prosnap") sizes = ["Pin length <= 3000 mm"];
  if (product.category === "Belt surface" && !sizes.length) sizes = ["Standard surface"];

  return {
    materials: brochure.materials ? [...brochure.materials] : (materials.length ? [...new Set(materials)] : ["Confirm with brochure"]),
    colors: brochure.colors ? [...brochure.colors] : (inferredColors.length ? [...new Set(inferredColors)] : ["Confirm with brochure"]),
    sizes: sizes.length ? [...new Set(sizes)] : ["Not specified"]
  };
}

function optionMarkup(options) {
  return options.map((option) => `<option value="${option}">${option}</option>`).join("");
}

function selectedForActiveSeries() {
  return selectedConfigurations.filter((item) => {
    const product = products.find((candidate) => candidate.id === item.productId);
    return product && (activeSeries === "all" || product.seriesId === activeSeries);
  });
}

function productSourceImage(product) {
  return product.sourceImage || `assets/pages/page-${String(product.page).padStart(2, "0")}.png`;
}

function seriesOrderValue(seriesId) {
  const order = {
    all: 0,
    s1: 1,
    s2: 2,
    s41: 4.1,
    s5: 5,
    s61: 6.1,
    s7: 7,
    s81: 8.1,
    s9: 9,
    s91: 9.1,
    s10: 10,
    s11: 11,
    s13: 13,
    s14: 14,
    s15: 15,
    s17: 17,
    s18: 18
  };
  return order[seriesId] ?? 999;
}

function orderedSeriesCatalog() {
  return [...seriesCatalog].sort((a, b) => seriesOrderValue(a.id) - seriesOrderValue(b.id));
}

function renderNeeds() {
  needList.innerHTML = needs.map((need) => `
    <label class="need-option">
      <input type="checkbox" value="${need.id}" ${selectedNeeds.has(need.id) ? "checked" : ""}>
      <span><strong>${need.label}</strong><span>${need.hint}</span></span>
    </label>
  `).join("");

  needList.querySelectorAll("input").forEach((input) => {
    input.addEventListener("change", () => {
      input.checked ? selectedNeeds.add(input.value) : selectedNeeds.delete(input.value);
      render();
    });
  });
}

function renderSeries() {
  seriesSelect.innerHTML = orderedSeriesCatalog().map((series) => `
    <option value="${series.id}" ${series.id === activeSeries ? "selected" : ""}>${series.label}</option>
  `).join("");

  const series = seriesCatalog.find((item) => item.id === activeSeries);
  document.querySelector("#activeSeriesLabel").textContent = series.family;
  document.querySelector("#activeSeriesTitle").textContent = `${series.title} - ${series.pitch}`;
  document.querySelector("#activeSeriesCopy").textContent = series.description;
  seriesSummary.textContent = `${series.source}. More series can be added to the catalog data as brochures are added.`;
}

function renderCategories() {
  const seriesProducts = products.filter((product) => activeSeries === "all" || product.seriesId === activeSeries);
  const categories = ["All", ...new Set(seriesProducts.map((product) => product.category))];
  categoryFilters.innerHTML = categories.map((category) => `
    <button class="segment ${category === activeCategory ? "is-active" : ""}" data-category="${category}">${category}</button>
  `).join("");

  categoryFilters.querySelectorAll("button").forEach((button) => {
    button.addEventListener("click", () => {
      activeCategory = button.dataset.category;
      render();
    });
  });
}

function renderProducts() {
  const query = searchInput.value.trim();
  const visible = products
    .filter((product) => activeSeries === "all" || product.seriesId === activeSeries)
    .map((product) => ({ ...product, score: scoreProduct(product) }))
    .filter((product) => activeCategory === "All" || product.category === activeCategory)
    .filter((product) => !query || matchesSearch(product, query))
    .sort((a, b) => b.score - a.score || seriesOrderValue(a.seriesId) - seriesOrderValue(b.seriesId) || a.category.localeCompare(b.category) || a.title.localeCompare(b.title));

  productGrid.innerHTML = visible.map((product) => {
    const selectedCount = selectedConfigurations.filter((item) => item.productId === product.id).length;
    const recommended = product.score > 0;
    const warning = product.id === "s61-36-flt";
    return `
      <article class="product-card ${recommended ? "is-recommended" : ""}">
        <img class="product-image" src="${product.image}" alt="${product.title} brochure preview">
        <div class="product-content">
          <div class="card-title-row">
            <div>
              <p class="eyebrow">${product.category}</p>
              <h3>${product.title}</h3>
            </div>
            <span class="score-pill">${recommended ? product.score + " match" : "review"}</span>
          </div>
          <p>${product.bestFit}</p>
          <div class="tags">
            <span class="tag opening">${product.opening}</span>
            ${product.tags.slice(0, 3).map((tag) => `<span class="tag">${tagLabel(tag)}</span>`).join("")}
            ${warning ? `<span class="tag warning">large openings</span>` : ""}
          </div>
          <div class="spec-row">
            <span>Page ${product.page}</span>
            <span>${product.materials.split(";")[0]}</span>
          </div>
          <div class="card-actions">
            <button class="primary-button" data-configure="${product.id}">Configure${selectedCount ? ` (${selectedCount})` : ""}</button>
            <button class="secondary-button" data-view="${product.id}">Details</button>
          </div>
        </div>
      </article>
    `;
  }).join("");

  productGrid.querySelectorAll("[data-configure]").forEach((button) => {
    button.addEventListener("click", () => {
      openConfigurator(button.dataset.configure);
    });
  });

  productGrid.querySelectorAll("[data-view]").forEach((button) => {
    button.addEventListener("click", () => openDetails(button.dataset.view));
  });
}

function tagLabel(tag) {
  const match = needs.find((need) => need.id === tag);
  return match ? match.label : tag;
}

function openConfigurator(productId) {
  const product = products.find((item) => item.id === productId);
  if (!product) return;

  const options = getTraitOptions(product);
  configuringProductId = productId;

  document.querySelector("#configCategory").textContent = product.category;
  document.querySelector("#configTitle").textContent = product.title;
  document.querySelector("#configFit").textContent = product.bestFit;
  document.querySelector("#configMaterial").innerHTML = optionMarkup(options.materials);
  document.querySelector("#configColor").innerHTML = optionMarkup(options.colors);
  document.querySelector("#configHeight").innerHTML = optionMarkup(options.sizes);
  document.querySelector("#configHeightWrap").style.display = options.sizes.length ? "grid" : "none";
  document.querySelector("#configWidth").value = "";
  document.querySelector("#configLength").value = "";
  document.querySelector("#configQuantity").value = "1";
  document.querySelector("#configNotes").value = "";

  configureDialog.showModal();
}

function addConfiguredItem() {
  if (!configuringProductId) return;
  const product = products.find((item) => item.id === configuringProductId);
  if (!product) return;

  selectedConfigurations.push({
    id: `${configuringProductId}-${Date.now()}-${Math.random().toString(16).slice(2)}`,
    productId: configuringProductId,
    material: document.querySelector("#configMaterial").value,
    color: document.querySelector("#configColor").value,
    width: document.querySelector("#configWidth").value.trim(),
    length: document.querySelector("#configLength").value.trim(),
    size: document.querySelector("#configHeight").value,
    quantity: document.querySelector("#configQuantity").value || "1",
    notes: document.querySelector("#configNotes").value.trim()
  });

  configuringProductId = null;
  configureDialog.close();
  renderSelection();
  renderProducts();
}

function formatConfiguration(item) {
  const details = [
    item.material,
    item.color,
    item.size && item.size !== "Not specified" ? item.size : "",
    item.width ? `Width ${item.width}` : "",
    item.length ? `Length ${item.length}` : "",
    `Qty ${item.quantity}`
  ].filter(Boolean);
  return details.join(" / ");
}

function renderSelection() {
  const selected = selectedForActiveSeries();
  selectionCount.textContent = `${selected.length} item${selected.length === 1 ? "" : "s"}`;

  selectionList.innerHTML = selected.length ? selected.map((item) => {
    const product = products.find((candidate) => candidate.id === item.productId);
    return `
    <div class="selection-item">
      <strong>${product.title}</strong>
      <span class="small-note">${formatConfiguration(item)}</span>
      ${item.notes ? `<span class="small-note">${item.notes}</span>` : ""}
      <button class="text-button" data-remove="${item.id}">Remove</button>
    </div>
  `;
  }).join("") : `<p class="small-note">Configure products to build a customer recommendation.</p>`;

  selectionList.querySelectorAll("[data-remove]").forEach((button) => {
    button.addEventListener("click", () => {
      const index = selectedConfigurations.findIndex((item) => item.id === button.dataset.remove);
      if (index >= 0) selectedConfigurations.splice(index, 1);
      renderSelection();
      renderProducts();
      renderCompare();
    });
  });

  renderCompare();
}

function renderCompare() {
  const selected = selectedForActiveSeries();
  compareBody.innerHTML = selected.length ? selected.map((item) => {
    const product = products.find((candidate) => candidate.id === item.productId);
    return `
    <tr>
      <td><strong>${product.title}</strong><br><span class="small-note">${product.category}</span></td>
      <td>${formatConfiguration(item)}${item.notes ? `<br><span class="small-note">${item.notes}</span>` : ""}</td>
      <td>${product.bestFit}</td>
      <td>${product.opening}</td>
      <td>${product.materials}</td>
      <td>${product.temperature}</td>
      <td><a href="${productSourceImage(product)}" target="_blank" rel="noreferrer">Page ${product.page}</a></td>
    </tr>
  `;
  }).join("") : `
    <tr>
      <td colspan="7" class="small-note">No configured products selected yet. Configure a few options above to compare them here.</td>
    </tr>
  `;
}

function renderStats() {
  const seriesProducts = products.filter((product) => activeSeries === "all" || product.seriesId === activeSeries);
  const recommendedCount = seriesProducts.filter((product) => scoreProduct(product) > 0).length;
  const seriesCount = new Set(seriesProducts.map((product) => product.seriesId)).size;
  quickStats.innerHTML = `
    <div class="stat"><b>${recommendedCount}</b><span>Matches</span></div>
    <div class="stat"><b>${seriesProducts.length}</b><span>Products</span></div>
    <div class="stat"><b>${seriesCount}</b><span>Series</span></div>
  `;
  needCount.textContent = `${selectedNeeds.size} selected`;
}

function openDetails(productId) {
  const product = products.find((item) => item.id === productId);
  if (!product) return;

  document.querySelector("#dialogImage").src = productSourceImage(product);
  document.querySelector("#dialogImage").alt = `${product.title} brochure page`;
  document.querySelector("#dialogCategory").textContent = product.category;
  document.querySelector("#dialogTitle").textContent = product.title;
  document.querySelector("#dialogDescription").textContent = product.description;
  document.querySelector("#dialogPage").href = productSourceImage(product);
  document.querySelector("#dialogSpecs").innerHTML = `
    <dt>Best fit</dt><dd>${product.bestFit}</dd>
    <dt>Opening</dt><dd>${product.opening}</dd>
    <dt>Materials</dt><dd>${product.materials}</dd>
    <dt>Temperature</dt><dd>${product.temperature}</dd>
    <dt>Notes</dt><dd>${product.notes}</dd>
  `;

  dialog.showModal();
}

function fieldValue(id) {
  return document.querySelector(`#${id}`)?.value.trim() || "";
}

function setFieldValue(id, value) {
  const field = document.querySelector(`#${id}`);
  if (field) field.value = value ?? "";
}

function numericField(id) {
  const value = fieldValue(id).replace(/,/g, "");
  const match = value.match(/-?\d+(\.\d+)?/);
  return match ? Number(match[0]) : 0;
}

function summaryMarkup(rows) {
  const visible = rows.filter((row) => row.value);
  return visible.length
    ? visible.map((row) => `<div><strong>${row.label}:</strong> ${row.value}</div>`).join("")
    : `<div class="small-note">No information entered yet.</div>`;
}

function quoteLineItems() {
  return selectedForActiveSeries().map((item) => {
    const product = products.find((candidate) => candidate.id === item.productId);
    return {
      productId: item.productId,
      product: product?.title || item.productId,
      category: product?.category || "",
      configuration: formatConfiguration(item),
      quantity: item.quantity || "1",
      notes: item.notes,
      source: product ? `Page ${product.page}` : ""
    };
  });
}

async function apiRequest(url, options = {}) {
  const response = await fetch(url, {
    headers: { "Content-Type": "application/json", ...(options.headers || {}) },
    ...options
  });
  const payload = await response.json().catch(() => ({}));
  if (!response.ok) {
    if ([404, 405].includes(response.status) && url.startsWith("/api/")) {
      throw new Error(
        "The backend API is not available on this address. Start the app with npm start and open http://localhost:3000."
      );
    }
    throw new Error(payload.error || `Request failed (${response.status}).`);
  }
  return payload;
}

function setDatabaseStatus(message, isError = false) {
  const status = document.querySelector("#databaseStatus");
  status.textContent = message;
  status.classList.add("is-visible");
  status.classList.toggle("is-error", isError);
}

async function syncProductCatalog() {
  const catalog = products.map((product) => ({
    ...product,
    traits: getTraitOptions(product)
  }));
  try {
    await apiRequest("/api/products/sync", {
      method: "POST",
      body: JSON.stringify({ products: catalog })
    });
  } catch (error) {
    console.info(`Product database sync skipped: ${error.message}`);
  }
}

function purchaseDate(value) {
  if (!value) return "Date unavailable";
  return new Intl.DateTimeFormat(undefined, { dateStyle: "medium" }).format(new Date(value));
}

async function findCustomerHistory() {
  const history = document.querySelector("#customerHistory");
  const params = new URLSearchParams({
    company: fieldValue("customerCompany"),
    email: fieldValue("customerEmail")
  });
  history.innerHTML = `<span class="small-note">Searching customer history...</span>`;

  try {
    const data = await apiRequest(`/api/customers/search?${params}`);
    if (!data.customer) {
      history.innerHTML = `<span class="small-note">No prior customer or quote history found.</span>`;
      return;
    }

    fillCustomerFields(data.customer);
    const purchases = data.purchases || [];
    history.innerHTML = `
      <div class="history-card">
        <strong>${escapeHtml(data.customer.company)}</strong>
        <span>${escapeHtml(data.customer.rep || data.customer.email || "Customer record")}</span>
        <span>${purchases.length} saved quote${purchases.length === 1 ? "" : "s"}</span>
      </div>
      ${purchases.slice(0, 5).map((purchase) => `
        <div class="history-card">
          <strong>${escapeHtml(purchase.quoteNumber ? `${purchase.quoteNumber} · ${purchase.project || "Saved quote"}` : purchase.project || "Saved quote")}</strong>
          <span>${escapeHtml(purchase.status || "draft")} quote</span>
          <span>${purchaseDate(purchase.createdAt)} · ${purchase.products?.length || 0} product line${purchase.products?.length === 1 ? "" : "s"}</span>
          <span>${escapeHtml((purchase.products || []).map((item) => item.product).join(", ") || "No product names stored")}</span>
        </div>
      `).join("")}
    `;
  } catch (error) {
    history.innerHTML = `<span class="small-note">${escapeHtml(error.message)}</span>`;
  }
}

function fillCustomerFields(customer) {
  setFieldValue("customerCompany", customer.company);
  setFieldValue("customerRep", customer.rep);
  setFieldValue("customerPhone", customer.phone);
  setFieldValue("customerEmail", customer.email);
  setFieldValue("customerAddress", customer.address);
  setFieldValue("application", customer.application);
  setFieldValue("quoteCustomerNumber", customer.customerNumber);
}

function clearCustomerFields() {
  ["customerCompany", "customerRep", "customerPhone", "customerEmail", "customerAddress", "application", "quoteCustomerNumber"]
    .forEach((id) => setFieldValue(id, ""));
  document.querySelector("#customerHistory").innerHTML =
    `<span class="small-note">Enter a company or email to review prior purchases.</span>`;
}

function showPortalScreen(screen) {
  document.querySelector("#loginScreen").hidden = screen !== "login";
  document.querySelector("#customerGateway").hidden = screen !== "gateway";
  document.querySelector("#appShell").hidden = screen !== "workspace";
}

function applySalesRep(rep) {
  authenticatedRep = rep;
  setFieldValue("salespersonName", rep.name);
  setFieldValue("salespersonPhone", rep.phone);
  setFieldValue("salespersonEmail", rep.email);
  document.querySelector("#repName").textContent = rep.name;
  const roleLabel = rep.role === "master-admin" ? "Master admin" : "Sales representative";
  document.querySelector("#repEmail").textContent = `${roleLabel} · ${rep.email}`;
  document.querySelector("#repAvatar").textContent = rep.name
    .split(/\s+/)
    .map((part) => part[0])
    .join("")
    .slice(0, 2)
    .toUpperCase();
  document.querySelector("#gatewayWelcome").textContent =
    `Welcome, ${rep.name}. Start a new customer record or retrieve an existing customer and purchase history.`;
}

async function initializePortal() {
  try {
    const data = await apiRequest("/api/auth/me");
    applySalesRep(data.rep);
    showPortalScreen("gateway");
    await syncProductCatalog();
  } catch {
    showPortalScreen("login");
  }
}

async function login(event) {
  event.preventDefault();
  const form = event.currentTarget;
  const button = form.querySelector('button[type="submit"]');
  const status = document.querySelector("#loginStatus");
  button.disabled = true;
  status.textContent = "Signing in...";
  try {
    const data = await apiRequest("/api/auth/login", {
      method: "POST",
      body: JSON.stringify({
        email: document.querySelector("#loginEmail").value,
        password: document.querySelector("#loginPassword").value
      })
    });
    applySalesRep(data.rep);
    form.reset();
    status.textContent = "";
    showPortalScreen("gateway");
    await syncProductCatalog();
  } catch (error) {
    status.textContent = error.message;
  } finally {
    button.disabled = false;
  }
}

async function logout() {
  await apiRequest("/api/auth/logout", { method: "POST" }).catch(() => {});
  authenticatedRep = null;
  clearCustomerFields();
  showPortalScreen("login");
}

function openWorkspace() {
  if (authenticatedRep) applySalesRep(authenticatedRep);
  showPortalScreen("workspace");
  window.scrollTo({ top: 0, behavior: "auto" });
}

async function lookupCustomer(event) {
  event.preventDefault();
  const status = document.querySelector("#lookupStatus");
  const params = new URLSearchParams({
    company: document.querySelector("#lookupCompany").value.trim(),
    email: document.querySelector("#lookupEmail").value.trim()
  });
  status.innerHTML = `<span class="small-note">Searching customer records...</span>`;
  try {
    const data = await apiRequest(`/api/customers/search?${params}`);
    if (!data.customer) {
      status.innerHTML = `<div class="lookup-message is-error">No matching customer was found. Check the spelling or start a new customer record.</div>`;
      return;
    }
    fillCustomerFields(data.customer);
    status.innerHTML = `<div class="lookup-result"><strong>${escapeHtml(data.customer.company)}</strong><span>${escapeHtml(data.customer.rep || data.customer.email || "Customer record")}</span><span>${data.purchases.length} saved quote${data.purchases.length === 1 ? "" : "s"}</span><button class="primary-button" id="continueCustomer" type="button">Continue with customer</button></div>`;
    document.querySelector("#continueCustomer").addEventListener("click", openWorkspace, { once: true });
  } catch (error) {
    status.innerHTML = `<div class="lookup-message is-error">${escapeHtml(error.message)}</div>`;
  }
}

async function saveCustomerQuote() {
  const button = document.querySelector("#saveQuote");
  button.disabled = true;
  setDatabaseStatus("Saving quote to customer record...");
  try {
    const data = collectQuoteAppData();
    data.recordType = "quote";
    data.status = "draft";
    const result = await apiRequest("/api/quotes", {
      method: "POST",
      body: JSON.stringify(data)
    });
    setDatabaseStatus(`Quote ${result.quoteNumber} saved to customer ${purchaseDate(result.savedAt)}.`);
    await findCustomerHistory();
  } catch (error) {
    setDatabaseStatus(error.message, true);
  } finally {
    button.disabled = false;
  }
}

function renderQuoteProductLines(lines = quoteLineItems()) {
  document.querySelector("#quoteProductLines").innerHTML = lines.length
    ? lines.map((line) => `
      <div class="quote-line">
        <strong>${line.product}</strong><br>
        <span>${line.configuration}</span>
        ${line.notes ? `<br><span class="small-note">${line.notes}</span>` : ""}
        ${line.source ? `<br><span class="small-note">${line.source}</span>` : ""}
      </div>
    `).join("")
    : `<div class="small-note">Configure at least one product before final quote review.</div>`;
}

function openQuoteApp() {
  const today = new Date().toISOString().slice(0, 10);
  const lines = quoteLineItems();
  document.querySelector("#quoteCustomerSummary").innerHTML = summaryMarkup([
    { label: "Company", value: fieldValue("customerCompany") },
    { label: "Customer rep", value: fieldValue("customerRep") },
    { label: "Phone", value: fieldValue("customerPhone") },
    { label: "Email", value: fieldValue("customerEmail") },
    { label: "Address", value: fieldValue("customerAddress") },
    { label: "Application", value: fieldValue("application") }
  ]);
  document.querySelector("#quoteSalesSummary").innerHTML = summaryMarkup([
    { label: "Name", value: fieldValue("salespersonName") },
    { label: "Phone", value: fieldValue("salespersonPhone") },
    { label: "Email", value: fieldValue("salespersonEmail") }
  ]);
  renderQuoteProductLines(lines);

  document.querySelector("#quoteProject").value = fieldValue("application");
  document.querySelector("#quoteDate").value = today;
  document.querySelector("#quoteAppNotes").value = fieldValue("notes");

  const firstLine = selectedForActiveSeries()[0];
  if (firstLine) {
    document.querySelector("#quoteBeltWidth").value = firstLine.width || "";
    document.querySelector("#quoteBeltLength").value = firstLine.length || "";
    document.querySelector("#quoteQuantity").value = firstLine.quantity || "1";
  }

  quoteAppDialog.showModal();
}

function runQuoteCalculation() {
  const widthText = fieldValue("quoteBeltWidth") || fieldValue("configWidth");
  const width = numericField("quoteBeltWidth");
  const length = numericField("quoteConveyorLength") || numericField("quoteBeltLength");
  const load = numericField("quoteProductLoad");
  const speed = numericField("quoteConveyorSpeed");
  const angle = numericField("quoteInclineAngle");
  const friction = numericField("quoteFriction") || 0.2;
  const beltWeight = numericField("quoteBeltWeight");
  const allowable = numericField("quoteAllowablePull");
  const widthMeters = width > 20 ? width / 1000 : width;
  const widthMm = width > 20 ? width : width * 1000;
  const angleRadians = angle * Math.PI / 180;
  const beltMassPerMeter = beltWeight && widthMeters ? beltWeight * widthMeters : 0;
  const movingMass = Math.max(0, load + beltMassPerMeter);
  const frictionForce = movingMass * Math.max(length, 0) * 9.81 * friction;
  const gradeForce = movingMass * Math.max(length, 0) * 9.81 * Math.sin(angleRadians);
  const effectivePull = Math.max(0, frictionForce + gradeForce);
  const pullPerWidth = widthMm ? effectivePull / widthMm : 0;
  const status = allowable ? (pullPerWidth <= allowable ? "Within entered allowable pull" : "Above entered allowable pull") : "Enter allowable pull to compare capacity";
  const missing = [];
  if (!width) missing.push("belt width");
  if (!length) missing.push("conveyor/belt length");
  if (!load && !beltWeight) missing.push("product load or belt weight");

  latestQuoteCalculation = {
    source: "Excel-derived browser estimate from PullForce.RunCalc input mapping and PFcalc pull-force formulas H51/C64.",
    inputs: {
      width: widthText,
      length,
      load,
      speed,
      angle,
      friction,
      beltWeight,
      allowable
    },
    outputs: {
      effectivePullN: Number(effectivePull.toFixed(2)),
      pullPerWidthNPerMm: Number(pullPerWidth.toFixed(3)),
      status,
      missingInputs: missing
    }
  };

  const result = document.querySelector("#quoteCalcResult");
  result.classList.toggle("warning", missing.length > 0 || (allowable && pullPerWidth > allowable));
  result.innerHTML = `
    <strong>${status}</strong>
    <span>Effective pull: ${effectivePull.toFixed(1)} N</span>
    <span>Pull per belt width: ${pullPerWidth.toFixed(3)} N/mm</span>
    <span>Source: workbook VBA maps inputs into PFcalc; formulas H51 and C64 perform the pull-force calculation.</span>
    ${missing.length ? `<span>Needed for better estimate: ${missing.join(", ")}.</span>` : ""}
  `;
}

function collectQuoteAppData() {
  return {
    sourceWorkbook: "forbo Fullsan Quote Request Form.xlsm",
    sourceWorkflow: "QuoteForm, PullForce, sprockets, cleats/flights, sidewalls, guides, PDF save",
    customer: {
      company: fieldValue("customerCompany"),
      rep: fieldValue("customerRep"),
      phone: fieldValue("customerPhone"),
      email: fieldValue("customerEmail"),
      address: fieldValue("customerAddress"),
      application: fieldValue("application"),
      number: fieldValue("quoteCustomerNumber")
    },
    salesperson: {
      name: fieldValue("salespersonName"),
      phone: fieldValue("salespersonPhone"),
      email: fieldValue("salespersonEmail")
    },
    quote: {
      project: fieldValue("quoteProject"),
      requestedDate: fieldValue("quoteDate"),
      desiredDelivery: fieldValue("quoteDelivery"),
      beltWidth: fieldValue("quoteBeltWidth"),
      beltLength: fieldValue("quoteBeltLength"),
      lengthAdjustment: fieldValue("quoteLengthAdjustment"),
      quantity: fieldValue("quoteQuantity"),
      cleats: fieldValue("quoteCleats"),
      cleatHeight: fieldValue("quoteCleatHeight"),
      sidewalls: fieldValue("quoteSidewalls"),
      sidewallHeight: fieldValue("quoteSidewallHeight"),
      topGuides: fieldValue("quoteTopGuides"),
      bottomGuides: fieldValue("quoteBottomGuides"),
      guideSpacing: fieldValue("quoteGuideSpacing"),
      sprockets: fieldValue("quoteSprockets"),
      conveyorType: fieldValue("quoteConveyorType"),
      conveyorLength: fieldValue("quoteConveyorLength"),
      conveyorSpeed: fieldValue("quoteConveyorSpeed"),
      productLoad: fieldValue("quoteProductLoad"),
      inclineAngle: fieldValue("quoteInclineAngle"),
      environment: fieldValue("quoteEnvironment"),
      friction: fieldValue("quoteFriction"),
      beltWeight: fieldValue("quoteBeltWeight"),
      allowablePull: fieldValue("quoteAllowablePull"),
      calculation: latestQuoteCalculation,
      notes: fieldValue("quoteAppNotes")
    },
    configuredProducts: quoteLineItems()
  };
}

function downloadQuoteData() {
  const data = collectQuoteAppData();
  const blob = new Blob([JSON.stringify(data, null, 2)], { type: "application/json" });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  const name = (data.customer.company || data.quote.project || "forbo-quote").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
  link.href = url;
  link.download = `${name || "forbo-quote"}-quote-data.json`;
  link.click();
  URL.revokeObjectURL(url);
}

function applyImportedQuoteData(data) {
  if (!data || typeof data !== "object") throw new Error("Quote data was not readable.");

  setFieldValue("customerCompany", data.customer?.company);
  setFieldValue("customerRep", data.customer?.rep);
  setFieldValue("customerPhone", data.customer?.phone);
  setFieldValue("customerEmail", data.customer?.email);
  setFieldValue("customerAddress", data.customer?.address);
  setFieldValue("application", data.customer?.application);
  setFieldValue("salespersonName", data.salesperson?.name);
  setFieldValue("salespersonPhone", data.salesperson?.phone);
  setFieldValue("salespersonEmail", data.salesperson?.email);

  setFieldValue("quoteCustomerNumber", data.customer?.number);
  setFieldValue("quoteProject", data.quote?.project);
  setFieldValue("quoteDate", data.quote?.requestedDate);
  setFieldValue("quoteDelivery", data.quote?.desiredDelivery);
  setFieldValue("quoteBeltWidth", data.quote?.beltWidth);
  setFieldValue("quoteBeltLength", data.quote?.beltLength);
  setFieldValue("quoteLengthAdjustment", data.quote?.lengthAdjustment);
  setFieldValue("quoteQuantity", data.quote?.quantity || "1");
  setFieldValue("quoteCleats", data.quote?.cleats || "No");
  setFieldValue("quoteCleatHeight", data.quote?.cleatHeight);
  setFieldValue("quoteSidewalls", data.quote?.sidewalls || "No");
  setFieldValue("quoteSidewallHeight", data.quote?.sidewallHeight);
  setFieldValue("quoteTopGuides", data.quote?.topGuides || "No");
  setFieldValue("quoteBottomGuides", data.quote?.bottomGuides || "No");
  setFieldValue("quoteGuideSpacing", data.quote?.guideSpacing);
  setFieldValue("quoteSprockets", data.quote?.sprockets);
  setFieldValue("quoteConveyorType", data.quote?.conveyorType || "Straight");
  setFieldValue("quoteConveyorLength", data.quote?.conveyorLength);
  setFieldValue("quoteConveyorSpeed", data.quote?.conveyorSpeed);
  setFieldValue("quoteProductLoad", data.quote?.productLoad);
  setFieldValue("quoteInclineAngle", data.quote?.inclineAngle);
  setFieldValue("quoteEnvironment", data.quote?.environment);
  setFieldValue("quoteFriction", data.quote?.friction || "0.2");
  setFieldValue("quoteBeltWeight", data.quote?.beltWeight);
  setFieldValue("quoteAllowablePull", data.quote?.allowablePull);
  setFieldValue("quoteAppNotes", data.quote?.notes);
  setFieldValue("notes", data.quote?.notes);

  latestQuoteCalculation = data.quote?.calculation || null;
  renderQuoteProductLines(data.configuredProducts || []);
  if (latestQuoteCalculation) {
    const calc = latestQuoteCalculation;
    const result = document.querySelector("#quoteCalcResult");
    result.classList.toggle("warning", Boolean(calc.outputs?.missingInputs?.length) || String(calc.outputs?.status || "").toLowerCase().includes("above"));
    result.innerHTML = `
      <strong>${escapeHtml(calc.outputs?.status || "Imported calculation")}</strong>
      <span>Effective pull: ${escapeHtml(calc.outputs?.effectivePullN ?? "-")} N</span>
      <span>Pull per belt width: ${escapeHtml(calc.outputs?.pullPerWidthNPerMm ?? "-")} N/mm</span>
      <span>Source: ${escapeHtml(calc.source || "Imported quote data")}</span>
      ${calc.outputs?.missingInputs?.length ? `<span>Needed for better estimate: ${escapeHtml(calc.outputs.missingInputs.join(", "))}.</span>` : ""}
    `;
  }

  render();
  openQuoteApp();
  renderQuoteProductLines(data.configuredProducts || []);
}

function importQuoteDataFile(file) {
  if (!file) return;
  const reader = new FileReader();
  reader.addEventListener("load", () => {
    try {
      applyImportedQuoteData(JSON.parse(reader.result));
    } catch (error) {
      alert(`Could not import quote data: ${error.message}`);
    }
  });
  reader.readAsText(file);
}

function escapeHtml(value) {
  return String(value ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

function printFields(rows) {
  return rows.map(([label, value]) => `
    <div class="print-field">
      <strong>${escapeHtml(label)}</strong>
      <span>${escapeHtml(value || "-")}</span>
    </div>
  `).join("");
}

function renderQuotePrintSheet() {
  const data = collectQuoteAppData();
  const calc = data.quote.calculation;
  const productRows = data.configuredProducts.length
    ? data.configuredProducts.map((line) => `
      <tr>
        <td>${escapeHtml(line.product)}</td>
        <td>${escapeHtml(line.category)}</td>
        <td>${escapeHtml(line.configuration)}</td>
        <td>${escapeHtml(line.notes || "-")}</td>
        <td>${escapeHtml(line.source || "-")}</td>
      </tr>
    `).join("")
    : `<tr><td colspan="5">No configured products selected.</td></tr>`;

  document.querySelector("#quotePrintSheet").innerHTML = `
    <div class="print-page">
      <header class="print-header">
        <div>
          <p class="eyebrow">Forbo Product Lines</p>
          <h1>Fullsan Quote Request</h1>
          <p>${escapeHtml(data.quote.project || data.customer.application || "Quote packet")}</p>
        </div>
        <div class="print-meta">
          <p><strong>Requested:</strong> ${escapeHtml(data.quote.requestedDate || new Date().toISOString().slice(0, 10))}</p>
          <p><strong>Source:</strong> ${escapeHtml(data.sourceWorkbook)}</p>
          <p><strong>Workflow:</strong> QuoteForm / PFcalc / QUOTE_CSR</p>
        </div>
      </header>

      <div class="print-grid">
        <section class="print-section">
          <h2>Customer</h2>
          ${printFields([
            ["Company", data.customer.company],
            ["Customer rep", data.customer.rep],
            ["Customer number", data.customer.number],
            ["Phone", data.customer.phone],
            ["Email", data.customer.email],
            ["Address", data.customer.address],
            ["Application", data.customer.application]
          ])}
        </section>

        <section class="print-section">
          <h2>Salesperson</h2>
          ${printFields([
            ["Name", data.salesperson.name],
            ["Phone", data.salesperson.phone],
            ["Email", data.salesperson.email]
          ])}
        </section>

        <section class="print-section wide">
          <h2>Configured Products</h2>
          <table class="print-table">
            <thead>
              <tr>
                <th>Product</th>
                <th>Category</th>
                <th>Configuration</th>
                <th>Notes</th>
                <th>Source</th>
              </tr>
            </thead>
            <tbody>${productRows}</tbody>
          </table>
        </section>

        <section class="print-section">
          <h2>Quote Details</h2>
          ${printFields([
            ["Project / quote name", data.quote.project],
            ["Desired delivery", data.quote.desiredDelivery],
            ["Quantity", data.quote.quantity],
            ["Belt width", data.quote.beltWidth],
            ["Belt length", data.quote.beltLength],
            ["Length adjustment", data.quote.lengthAdjustment]
          ])}
        </section>

        <section class="print-section">
          <h2>Fabrication</h2>
          ${printFields([
            ["Cleats / flights", data.quote.cleats],
            ["Cleat height", data.quote.cleatHeight],
            ["Sidewalls", data.quote.sidewalls],
            ["Sidewall height", data.quote.sidewallHeight],
            ["Top guides", data.quote.topGuides],
            ["Bottom guides", data.quote.bottomGuides],
            ["Guide spacing", data.quote.guideSpacing],
            ["Sprockets", data.quote.sprockets]
          ])}
        </section>

        <section class="print-section">
          <h2>Pull-Force Inputs</h2>
          ${printFields([
            ["Conveyor type", data.quote.conveyorType],
            ["Conveyor length", data.quote.conveyorLength],
            ["Conveyor speed", data.quote.conveyorSpeed],
            ["Product load", data.quote.productLoad],
            ["Incline angle", data.quote.inclineAngle],
            ["Environment", data.quote.environment],
            ["Friction coefficient", data.quote.friction],
            ["Belt weight", data.quote.beltWeight],
            ["Allowable pull", data.quote.allowablePull]
          ])}
        </section>

        <section class="print-section">
          <h2>Calculation Result</h2>
          ${calc ? printFields([
            ["Status", calc.outputs.status],
            ["Effective pull", `${calc.outputs.effectivePullN} N`],
            ["Pull per belt width", `${calc.outputs.pullPerWidthNPerMm} N/mm`],
            ["Missing inputs", calc.outputs.missingInputs.join(", ") || "-"],
            ["Source", calc.source]
          ]) : `<p>Pull-force estimate has not been run yet.</p>`}
        </section>

        <section class="print-section wide">
          <h2>Quote Notes</h2>
          <p>${escapeHtml(data.quote.notes || "-")}</p>
        </section>
      </div>
    </div>
  `;
}

function printQuoteAppSheet() {
  renderQuotePrintSheet();
  document.body.classList.add("quote-printing");
  window.print();
  setTimeout(() => document.body.classList.remove("quote-printing"), 250);
}

function render() {
  renderSeries();
  renderNeeds();
  renderCategories();
  renderProducts();
  renderSelection();
  renderStats();
}

seriesSelect.addEventListener("change", () => {
  activeSeries = seriesSelect.value;
  activeCategory = "All";
  render();
});
searchInput.addEventListener("input", renderProducts);
document.querySelector("#closeDialog").addEventListener("click", () => dialog.close());
document.querySelector("#closeConfig").addEventListener("click", () => configureDialog.close());
document.querySelector("#cancelConfig").addEventListener("click", () => configureDialog.close());
configureForm.addEventListener("submit", (event) => {
  event.preventDefault();
  addConfiguredItem();
});
document.querySelector("#printButton").addEventListener("click", printQuoteAppSheet);
document.querySelector("#createQuoteAppButton").addEventListener("click", openQuoteApp);
document.querySelector("#findCustomerButton").addEventListener("click", findCustomerHistory);
document.querySelector("#closeQuoteApp").addEventListener("click", () => quoteAppDialog.close());
document.querySelector("#closeQuoteAppDone").addEventListener("click", () => quoteAppDialog.close());
document.querySelector("#printQuoteApp").addEventListener("click", printQuoteAppSheet);
document.querySelector("#saveQuote").addEventListener("click", saveCustomerQuote);
document.querySelector("#downloadQuoteJson").addEventListener("click", downloadQuoteData);
document.querySelector("#importQuoteJson").addEventListener("click", () => document.querySelector("#quoteImportFile").click());
document.querySelector("#quoteImportFile").addEventListener("change", (event) => {
  importQuoteDataFile(event.target.files[0]);
  event.target.value = "";
});
document.querySelector("#runQuoteCalc").addEventListener("click", runQuoteCalculation);
document.querySelector("#sidebarToggle").addEventListener("click", () => {
  const isMobile = window.matchMedia("(max-width: 980px)").matches;
  document.body.classList.toggle(isMobile ? "sidebar-open" : "sidebar-collapsed");
});
document.querySelectorAll(".sidebar-section-toggle").forEach((button) => {
  button.addEventListener("click", () => {
    const section = button.closest(".sidebar-section");
    const isOpen = section.classList.toggle("is-open");
    button.setAttribute("aria-expanded", String(isOpen));
  });
});
document.querySelector("#resetButton").addEventListener("click", () => {
  selectedNeeds.clear();
  selectedConfigurations.splice(0, selectedConfigurations.length);
  activeCategory = "All";
  activeSeries = "all";
  searchInput.value = "";
  [
    "customerCompany",
    "customerRep",
    "customerPhone",
    "customerEmail",
    "customerAddress",
    "application",
    "salespersonName",
    "salespersonPhone",
    "salespersonEmail",
    "notes",
    "quoteCustomerNumber",
    "quoteProject",
    "quoteDate",
    "quoteDelivery",
    "quoteBeltWidth",
    "quoteBeltLength",
    "quoteLengthAdjustment",
    "quoteQuantity",
    "quoteCleatHeight",
    "quoteSidewallHeight",
    "quoteGuideSpacing",
    "quoteSprockets",
    "quoteConveyorLength",
    "quoteConveyorSpeed",
    "quoteProductLoad",
    "quoteInclineAngle",
    "quoteEnvironment",
    "quoteFriction",
    "quoteBeltWeight",
    "quoteAllowablePull",
    "quoteAppNotes"
  ].forEach((id) => {
    const field = document.querySelector(`#${id}`);
    if (field) field.value = "";
  });
  document.querySelector("#quoteFriction").value = "0.2";
  latestQuoteCalculation = null;
  render();
});

render();
document.querySelector("#loginForm").addEventListener("submit", login);
document.querySelector("#togglePassword").addEventListener("click", (event) => {
  const input = document.querySelector("#loginPassword");
  const isPassword = input.type === "password";
  input.type = isPassword ? "text" : "password";
  event.currentTarget.textContent = isPassword ? "Hide" : "Show";
  event.currentTarget.setAttribute("aria-label", isPassword ? "Hide password" : "Show password");
});
document.querySelectorAll("[data-logout]").forEach((button) => button.addEventListener("click", logout));
document.querySelector("#newCustomerButton").addEventListener("click", () => {
  clearCustomerFields();
  openWorkspace();
});
document.querySelector("#lookupCustomerButton").addEventListener("click", () => {
  document.querySelector("#lookupPanel").hidden = false;
  document.querySelector("#lookupCompany").focus();
});
document.querySelector("#cancelLookup").addEventListener("click", () => {
  document.querySelector("#lookupPanel").hidden = true;
  document.querySelector("#lookupPanel").reset();
  document.querySelector("#lookupStatus").innerHTML = "";
});
document.querySelector("#lookupPanel").addEventListener("submit", lookupCustomer);
initializePortal();
