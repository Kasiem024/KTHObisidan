Systems Architecture of Gemini Notebook and Gemini Deep Research: Ingestion, Grounding, and Synthesis Mechanics
Findings
Source handling in Gemini Notebook
Google NotebookLM was officially renamed to Gemini Notebook to align the utility with Google’s consolidated Gemini AI ecosystem and integrate secure cloud computer execution environments — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 1]
The personal Standard (Free) subscription plan limits users to exactly 50 sources per notebook — July 16, 2026 | Gemini Notebook Standard | Official Google Material | Documented Behavior [cite: 2, 3, 4]
The personal Plus subscription plan supports a maximum limit of exactly 100 sources per notebook — July 16, 2026 | Gemini Notebook Plus | Official Google Material | Documented Behavior [cite: 3, 4]
A third-party technical review observed that the NotebookLM Plus plan allows a maximum limit of exactly 300 sources per notebook — 2026 | NotebookLM Plus | Third-Party | Observed Behavior [cite: 5]
A third-party platform analysis documented that the Gemini Notebook Plus plan supports up to exactly 500 sources per notebook — June 2026 | Gemini Notebook Plus | Third-Party | Documented Behavior [cite: 6]
The personal Pro subscription plan supports a maximum limit of exactly 300 sources per notebook — July 16, 2026 | Gemini Notebook Pro | Official Google Material | Documented Behavior [cite: 3, 4]
The Google AI Ultra 20 TB subscription plan supports a maximum limit of exactly 500 sources per notebook — July 16, 2026 | Gemini Notebook Ultra (20 TB) | Official Google Material | Documented Behavior [cite: 3, 4]
The Google AI Ultra 30 TB subscription plan supports a maximum limit of exactly 600 sources per notebook — July 16, 2026 | Gemini Notebook Ultra (30 TB) | Official Google Material | Documented Behavior [cite: 3, 4]
Gemini Notebook Enterprise licenses deployed via Google Cloud limit ingestion to a maximum of exactly 300 sources per notebook — July 16, 2026 | Gemini Notebook Enterprise | Official Google Material | Documented Behavior [cite: 3, 7]
Workspace and Educational accounts are tiered across five discrete ingestion levels, capping notebooks at exactly 50 sources under Standard, 100 sources under More, 300 sources under Higher, 400 sources under Expanded, and 600 sources under the Highest tier — 2026 Snapshot | Gemini Notebook Workspace/EDU | Third-Party | Documented Behavior [cite: 8]
The system supports 16 distinct source types, consisting of audio files, copy-and-pasted text, Google Docs, Google Slides, Google Sheets, images, Microsoft Word (docx), Text (txt), Markdown (md), PDF files, CSV, PowerPoint (pptx), eligible purchased Play Books, Web URLs, ePub files, and Gemini Chats — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2]
Google Slides uploads are strictly capped at a maximum limit of exactly 100 slides per file — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2]
Google Sheets uploads are strictly capped at a maximum token limit of exactly 100,000 tokens per file — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2]
Gemini Notebook Enterprise can process approximately 150,000 active cells in a single sheet of an uploaded Microsoft Excel workbook — July 16, 2026 | Gemini Notebook Enterprise | Official Google Material | Documented Behavior [cite: 7]
Files imported from Google Drive automatically sync and update every few minutes when a notebook is active, whereas other file imports are static snapshots that must be manually deleted and re-uploaded to reflect modifications — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 9]
Ingested Google Drive documents automatically omit all footnotes, comments, and sub-tab contents — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 9]
Ingested Web URLs only scrape plain HTML text content, discarding nested webpages, paywalled pages, images, and embedded videos — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 9]
Public YouTube URLs are ingested solely as text transcripts, requiring auto-generated or user-uploaded captions, and are automatically deleted from the notebook within 30 days if the video is deleted or made private — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 9]
Local audio imports transcribe the spoken content into text upon ingestion, while files containing no speech or low-quality audio will fail to import — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 9]
The system supports audio transcriptions across exactly 71 distinct languages, including English, Spanish, Japanese, and traditional Chinese — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2]
Ingested XLSX files are converted into an intermediate layout format that preserves table structures, which adds characters representing boundaries and cells that are included in the calculated word count — July 16, 2026 | Gemini Notebook Enterprise | Official Google Material | Documented Behavior [cite: 7]
The maximum size limit for any single local file upload is exactly 200MB, and the maximum length limit is exactly 500,000 words across Standard, Plus, Pro, and Ultra tiers — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 4, 9, 10, 11, 12, 13]
Gemini Notebook Enterprise increases the single-file size ingestion ceiling to a maximum of exactly 500MB, while retaining the length cap of exactly 500,000 words — July 16, 2026 | Gemini Notebook Enterprise | Official Google Material | Documented Behavior [cite: 7, 8]
A third-party pricing review asserted that standard plans restrict ingestion to a source character limit of exactly 500,000 characters per source — 2025 | NotebookLM Standard | Third-Party | Documented Behavior [cite: 14]
When an import fails due to exceeding the 500,000-word limit, the 200MB size limit (or 500MB on Enterprise), copy-protected PDFs, unsafe content flags, or lack of captions on YouTube, the system rejects the file entirely, throwing in-app errors — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 9, 10]
Backing Gemini models, context windows, and grounding
Gemini Notebook's answering engine is backed by the natively multimodal Gemini 3.5 model combined with Antigravity — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 1, 6]
The Gemini Deep Research agent's reasoning core is powered by the Gemini 3 Pro model — June 2026 | Gemini Deep Research | Official Google Material | Documented Behavior [cite: 15]
An early implementation of the Gemini Deep Research agent inside Gemini Advanced was observed to run on Gemini 2.0 Flash Thinking — Late 2024 | Gemini Deep Research (App) | Third-Party | Observed Behavior [cite: 16]
A refined implementation of the Gemini Deep Research application inside Gemini Advanced was documented as running on the Gemini 2.5 Pro model — Early 2025 | Gemini Deep Research (App) | Third-Party | Documented Behavior [cite: 17]
The Google GenAI SDK exposes two primary Deep Research agent versions: deep-research-preview-04-2026 (optimized for speed) and deep-research-max-preview-04-2026 (optimized for exhaustiveness) — April 2026 | Gemini Deep Research (API) | Official Google Material | Documented Behavior [cite: 18, 19]
The native context window size of Gemini 1.5 Pro is exactly 1,000,000 tokens — February 2024 | Gemini 1.5 Pro | Official Google Material | Documented Behavior [cite: 20, 21]
Third-party literature states that Gemini 1.5 Pro supports a native context window size of up to 2,000,000 tokens, which equates to a short-term memory capacity of approximately 25,000,000 words — 2024 / 2026 | Gemini 1.5 Pro | Third-Party | Documented Behavior [cite: 22, 23, 24]
The flagship Gemini 3.5 Pro model possesses a native context window of exactly 2,000,000 tokens, with a maximum text output limit of exactly 64,000 tokens — June 30, 2026 | Gemini 3.5 Pro | Third-Party | Documented Behavior [cite: 24, 25]
The Gemini 3.5 Flash model supports a native context window of exactly 1,000,000 tokens, with a maximum text output limit of exactly 64,000 tokens — May 2026 | Gemini 3.5 Flash | Official Google Material | Documented Behavior [cite: 26, 27]
The Gemini 3 Flash model supports a native context window of exactly 1,048,576 tokens, with a maximum text output limit of exactly 65,536 tokens — December 2025 | Gemini 3 Flash | Official Google Material | Documented Behavior [cite: 27, 28]
Gemini Notebook utilizes "Source Grounding," loading entire documents directly into the massive context window of the model to retain complete semantic integrity and eliminate standard vector-chunking retrieval errors — 2024 / 2026 | Gemini Notebook | Third-Party | Documented Behavior [cite: 22, 23]
For larger file storage and semantic search, the API uses File Search stores, converting raw documents to chunked semantic embeddings via gemini-embedding-001 or gemini-embedding-2 — June 2026 | Gemini API | Official Google Material | Documented Behavior [cite: 29]
Chat responses in Gemini Notebook are strictly constrained to selected source contexts; the engine extracts inline citations linked to source passages and will return an explicit "not found" response rather than utilizing external pre-trained data to hallucinate answers — July 16, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 2, 23, 30, 31]
Deep Research planning, execution, and citations
Deep Research runs as an asynchronous, long-running agentic workflow executing a continuous planning-searching-reading-reasoning loop — April 2026 | Gemini Deep Research | Official Google Material | Documented Behavior [cite: 2, 15, 19, 32]
Deep Research execution begins by decomposing a high-level user query into smaller sub-queries, generating a multi-point, sequential, and parallelized research plan — Late 2024 | Gemini Deep Research | Official Google Material | Documented Behavior [cite: 2, 32, 33]
The agent supports collaborative planning via the collaborative_planning=True parameter in the Interactions API, which pauses execution to return a proposed outline that the user can iteratively edit, expand, or approve using natural language — April 2026 | Gemini Deep Research (API) | Official Google Material | Documented Behavior [cite: 18, 19]
The agent decides which pages to read by executing multi-step web crawls via Google Search algorithms, navigating deep into sites to locate granular data, identifying logical knowledge gaps, and recursively reformulating search queries as it learns — June 2026 | Gemini Deep Research | Official Google Material | Documented Behavior [cite: 2, 15, 32, 33]
Deep Research citation logic relies on multi-pass self-critique, de-duplication, and entity resolution, rejecting low-confidence, contradictory, or unverified pages to ensure all claims are mapped to objectively verifiable answer sets — January 28, 2026 | DeepSearchQA (Benchmark) | Official Google Material | Documented Behavior [cite: 2, 15, 32, 34]
The Deep Research agent can consult over exactly 100 sources in a single research task — April 2026 | Gemini Deep Research (API) | Official Google Material | Documented Behavior [cite: 18]
In comparison, Perplexity’s Deep Research mode is documented to check between exactly 50 and 100+ sources per query, compared to 10 to 20 sources in standard search mode — 2026 | Perplexity Deep Research | Third-Party | Documented Behavior [cite: 35]
Prompt formatting strongly steers agent behavior, allowing users to define output structures, sections, headers, and request the direct generation of native visual assets (like charts, graphs, and infographics) by activating the visualization: "auto" parameter — June 2026 | Gemini Deep Research (API) | Official Google Material | Documented Behavior [cite: 2, 15, 18, 19]
The agent is highly sensitive to prompting patterns; explicitly requesting source diversity, inline confidence levels, and precise audience descriptions alters the research criteria and the specific domains cited — Late 2024 | Gemini Deep Research (App) | Third-Party | Documented Behavior [cite: 16]
Documented input limits
Google upgraded the custom instructions field limit (Configure notebook settings) in Gemini Notebook twenty-fold, raising it from exactly 500 characters to a maximum of exactly 10,000 characters — December 5, 2025 | Gemini Notebook | Third-Party | Documented Behavior [cite: 36, 37, 38, 39]
Direct file uploads to the console are capped at exactly 7MB per file, while API or Cloud Storage imports support up to exactly 50MB for PDFs and exactly 7MB for plain text files — June 2026 | Gemini 3 Flash / API Console | Official Google Material | Documented Behavior [cite: 28, 40]
Complex user prompts of approximately 2,000 to 3,000 characters submitted to deep-research-pro-preview-12-2025 via the @google/genai JS SDK resulted in unresolved hanging, where the polling state of interactions.get() stayed indefinitely in_progress until hitting a 60-minute timeout — March 30-31, 2026 | Gemini API | Official Google Material / Third-Party Forum | Observed Behavior [cite: 41]
ChatGPT's Deep Research feature possesses a hidden limit of exactly 1,300 characters in its user prompt field, which can cause the search agent to fail silently if exceeded — Early 2025 | ChatGPT Deep Research | Third-Party | Observed Behavior [cite: 17]
Perplexity's Deep Research mode supports a maximum query prompt length of approximately 16,000 characters, compared to 4,000 characters in its standard mode — 2026 | Perplexity Deep Research | Third-Party | Documented Behavior [cite: 35]
Google transitioned Gemini Notebook to compute-based limits that factor in prompt complexity, chat length, and model types; when these limits are exceeded, users are blocked from further interaction and presented with in-app countdown notifications showing a 5-hour quota refresh window — September 2, 2026 | Gemini Notebook | Official Google Material | Documented Behavior [cite: 3, 42] (Note: Flagged under Rule 3 as a structural shift that replaces the rigid rolling 24-hour daily query quotas described in earlier 2026 documentation [cite: 4, 13]).
--------------------------------------------------------------------------------
Single-source claims
Enterprise data layout compilation and active cell constraints
Within the specialized framework of Google Cloud's enterprise knowledge management systems, several data constraints rely on singular technical specifications. Gemini Notebook Enterprise utilizes a layout preservation compiler that converts Microsoft Excel (XLSX) spreadsheets into an intermediate representation designed to retain structural boundaries and formatting tags [cite: 7]. This compilation step adds layout characters that count toward the system's strict 500,000-word ingestion ceiling [cite: 7]. Consequently, spreadsheets with visible, alphanumeric word counts well below 500,000 can trigger truncation or rejection errors if the conversion overhead pushes the total character representation past the platform limit [cite: 7].
Furthermore, the system's processing capabilities over tabular spreadsheets are limited to approximately 150,000 active cells per individual sheet [cite: 7]. This cell restriction does not represent an aggregate notebook cap, but rather a processing boundary for single sheet parsing, below which the layout preservation compiler can safely execute structural mapping without causing execution timeouts [cite: 7].
Digital copyright and specialized partner integrations
Google's "Expert Intelligence" initiative introduces specialized digital rights integrations that allow the ingestion of select, purchased commercial texts directly into Gemini Notebook [cite: 2]. Under this program, users can import eligible English-language ebooks from their Google Play Books libraries, provided they are signed into identical, verified accounts across both platforms [cite: 2].
The system uses a specific validation protocol to determine ebook eligibility, displaying a "Tools" badge near the page count on compatible store pages, or a "Use with Gemini Notebook" toggle in the user's personal web library [cite: 2]. Ebooks uploaded manually to Play Books libraries or restricted by publisher formatting constraints are excluded from this capability [cite: 2].
Reasoning engine optimization and benchmarks
During Google's architectural transitions, several performance metrics were established through singular comparative studies. The upgraded Gemini Notebook reasoning engine—integrated with Google's secure cloud computing environments and Antigravity—was evaluated against the platform's prior model baseline [cite: 1, 43]. This study documented a 69.9% win rate in large document analysis and a 78.2% win rate in advanced web research and source discovery, demonstrating significant improvements in contextual recall and layout reasoning [cite: 43].
Additionally, the underlying model training details for Gemini 3 Flash depend on custom software architectures [cite: 27]. The model card confirms that training was executed using JAX and ML Pathways software on Google's custom-designed Tensor Processing Units (TPUs) and TPU Pod clusters [cite: 27]. This specialized hardware utilization underpins the model's 1,048,576 token context window and 65,536 maximum output capacity [cite: 27, 28].
Real-world agent deployment and external benchmarks
The real-world application of agentic reasoning loops is highlighted in clinical research integrations. For instance, Axiom Bio deployed the Gemini Deep Research agent to predict drug toxicity, using its asynchronous browsing capabilities to navigate and extract evidence across extensive biomedical datasets [cite: 15]. Sundar Pichai noted that this agentic scaling occurred as Gemini 3 rolled out to Search on day one, alongside the developer release of Google Antigravity—a new agentic development platform [cite: 44].
In the developer tools ecosystem, third-party implementations of deep research agents exhibit distinct structural profiles. The table below compares these unique parameters across platforms:
Agent Platform
Backing Reasoning Engine
Documented Data Integration
Core Structural Output
Glean Deep Research [cite: 45]
GPT 5.1
Over 100 Enterprise Systems
5-to-10 Page Cited Reports
Perplexity Deep Research [cite: 35]
Claude 3.5 Sonnet / Multi-model
Web Index + File Uploads
3-to-5 Reasoning Loops
Gemini Deep Research [cite: 15, 18]
Gemini 3 Pro
Web Index, Gmail, Drive, Chat
100+ Cited Sources per Task
Additionally, specific visual parsing capabilities have been demonstrated on standard multimodal benchmarks. Gemini 3 Pro is documented to achieve state-of-the-art results on expert medical reasoning exams (such as MedXpertQA-MM and VQA-RAD) and supports highly precise video reasoning [cite: 46]. The model processes video at 10 frames-per-second, representing a 10x speedup over standard baseline sampling, which enables it to capture fast-paced physical mechanics [cite: 46].
--------------------------------------------------------------------------------
Not documented
Gemini Notebook prompt limits
Google's official help centers, developer guidelines, and API model cards do not state the maximum character or word limit allowed for a single chat question in Gemini Notebook.
Low-Quality Source Audit: A review of standard SEO blogs and content marketing sites revealed three articles that attempted to define this limit. Two articles conflated the 10,000-character custom instructions setting with the chat input field, asserting that users can write 10,000 characters per prompt. The third article claimed that a legacy limit of 500 characters still governs the prompt box. None of these claims are supported by official technical documentation.
Google Deep Research prompt limits
Google's official documentation does not state the maximum prompt length for a Deep Research query in either the Gemini Advanced web application or the Interactions API.
Low-Quality Source Audit: Six low-quality content-marketing and tutorial sites claimed to provide an answer. Four of these sources asserted that Google Deep Research inherits ChatGPT's 1,300-character prompt limit. The remaining two sources claimed that standard model context windows restrict initial prompts to exactly 4,000 characters. These figures are speculative and unsupported by Google's API specifications.
Exceeded prompt limits and threshold behaviors
What specifically happens when a user prompt in Google Deep Research or Gemini Notebook exceeds its length limit is not documented. Google does not publish the precise terminal behavior, truncation rules, or error codes triggered by excessively long prompts (unlike the documented 10,000-character custom instructions setting, which blocks further typing via UI constraints).
--------------------------------------------------------------------------------
Source inventory
Publisher
Title / Resource
Publication / Last Updated Date
Official / Third-Party
Primary Contribution in Report
The New School
NotebookLM Help Center Source Limits & Types [cite: 9]
Undated
Third-Party (Academic)
Documented static file copying and YouTube transcript retention rules.
Google Support
Gemini Notebook Word/Size Limits [cite: 10]
Undated
Official Google Material
Documented the standard 500,000-word and 200MB size limits.
Google Cloud Docs
Gemini Notebook Enterprise Overview [cite: 7]
July 16, 2026
Official Google Material
Documented XLSX cell limits and layout preservation formatting characters.
ValueAdd VC
NotebookLM Review 2026 [cite: 5]
2026
Third-Party
Provided conflicting 300-source capacity limits on Plus plans.
Github (teng-lin)
notebooklm-py Quota Limits [cite: 8]
2026 Snapshot
Third-Party
Documented tiered limits for Workspace/EDU source ingestion.
The New School
NotebookLM Features & Limitations [cite: 11]
Undated
Third-Party (Academic)
Documented Google Workspace for Education Terms of Service.
Dev.to
Architecting the Future of Research [cite: 22]
2024
Third-Party
Described the shift from traditional chunked RAG to Source Grounding.
Lowcode Agency
Claude vs NotebookLM [cite: 30]
Undated
Third-Party
Compared strict source grounding constraints with model reasoning.
University-365
Gemini Notebook Grounded AI Assistant [cite: 6]
June 2026
Third-Party
Documented underlying model upgrades and alternative Plus capacities.
ZenML
Source-Grounded LLM Assistant Guide [cite: 23]
Undated
Third-Party
Documented Project Tailwind origin and historical grounding strategies.
Google Cloud Docs
Deep Research Agent Technical Specs [cite: 40]
June 2026
Official Google Material
Documented direct API console upload size limitations.
Google Workspace
Meet Deep Research [cite: 33]
Late 2024
Official Google Material
Documented query decomposition and plan modification steps.
Google DeepMind
Deep Research Agent with Gemini API [cite: 15]
June 2026
Official Google Material
Documented Gemini 3 Pro reasoning core and DeepSearchQA performance.
MindStudio
Gemini Deep Research for market reports [cite: 16]
Late 2024
Third-Party
Documented Gemini 2.0 Flash Thinking app backing and prompt steering.
Google Blog
Google Gemini Deep Research [cite: 20]
Late 2024
Official Google Material
Documented initial 1M token context window rollout details.
Newscatcher API
What is Deep Research [cite: 32]
2026
Third-Party
Documented agentic search latency and retrieval-reasoning loops.
Glean
Deep Research Overview [cite: 45]
Undated
Third-Party
Documented Glean enterprise search integration and GPT 5.1 engine.
Google AI Docs
Gemini API File Search Guide [cite: 29]
June 2026
Official Google Material
Outlined semantic RAG stores and embedding models.
Atlas Workspace
Perplexity vs Gemini Workflow [cite: 47]
July 2026
Third-Party
Compared Drive context workflows with Perplexity Web workflows.
Google Support
Supported Source Types and Limits [cite: 2]
July 16, 2026
Official Google Material
Documented standard 100k token limits for Sheets and slide caps.
Google Support
Usage Limits by Plan [cite: 3]
July 16, 2026
Official Google Material
Tabulated limits for Standard, Plus, Pro, and Ultra subscription plans.
Google Support
Manage Gemini Notebook Limits [cite: 42]
September 2, 2026
Official Google Material
Documented the 5-hour compute-based quota refresh mechanism.
Google Support
Safety Flags and Precise Questions [cite: 10]
Undated
Official Google Material
Identified safety flags and safe content thresholds.
Google Support
Custom Chats and Output Formats [cite: 31]
Undated
Official Google Material
Documented response length settings and generated output types.
Google Blog
NotebookLM is now Gemini Notebook [cite: 1]
July 16, 2026
Official Google Material
Announced product renaming and secure cloud computer code execution.
Google DeepMind
Gemini 3 Pro Vision Capabilities [cite: 46]
December 2025
Official Google Material
Documented Gemini 3 Pro spatial, 10 FPS video, and expert exam benchmarks.
Google Blog
Upgrades to NotebookLM [cite: 43]
June 2026
Official Google Material
Documented reasoning engine performance margins and output formats.
Google Blog
Introducing Gemini 3 [cite: 44]
Late 2025
Official Google Material
Documented scale statistics and Antigravity platform releases.
Google Blog
Notebooks in Gemini [cite: 48]
April 8, 2026
Official Google Material
Documented cross-app syncing with the standard Gemini application.
Google DeepMind
Introducing Gemini 1.5 [cite: 21]
February 2024
Official Google Material
Outlined 1M context windows and Mixture-of-Experts architecture.
Google Cookbook
Get Started Deep Research Agent [cite: 18]
April 2026
Official Google Material
Provided API interaction configurations and 100-source task capacities.
Google AI Docs
File Search RAG Guide [cite: 29]
June 2026
Official Google Material
Documented semantic embedding ingestion parameters.
Google AI Docs
Gemini Deep Research Guide [cite: 19]
April 2026
Official Google Material
Described REST client schemas for Agent-config parameters.
Google DeepMind
Interactions API GA Announcement [cite: 49]
June 2026
Official Google Material
Highlighted remote Linux sandboxes, default agents, and skills.
MakeUseOf
Configure Notebook Settings [cite: 36]
Late 2025
Third-Party
Documented custom instructions limits and response length controls.
Android Authority
NotebookLM Custom Chat Prompt Boost [cite: 37]
December 5, 2025
Third-Party
Documented custom instruction character limit expansion.
Reddit
I Tested NotebookLM’s 10k Update [cite: 38]
Late 2025
Third-Party
Documented workflow automation via the 10,000 character update.
Medium
Custom AI Personas in NotebookLM [cite: 39]
Undated
Third-Party
Documented professional persona development frameworks.
Elite Cloud
NotebookLM Pricing 2025 [cite: 14]
2025
Third-Party
Documented pricing tiers and conflicting character limits.
Google Support
Supported Source Types and Limits [cite: 2]
July 16, 2026
Official Google Material
Documented the Expert Intelligence program and transcribable audio files.
arXiv
DeepSearchQA Technical Report [cite: 34]
January 28, 2026
Third-Party (Academic)
Documented de-duplication, entity resolution, and stopping criteria.
Google AI Docs
Gemini Deep Research Agent Specs [cite: 19]
April 2026
Official Google Material
Documented speed vs. exhaustiveness agent configurations.
Google AI Docs
Gemini 3.5 Flash Specs [cite: 26]
May 2026
Official Google Material
Documented model token output limits.
MindStudio
Gemini 3.5 Pro vs GPT-5.6 Sol [cite: 24]
July 12, 2026
Third-Party
Outlined context window comparisons between Google and OpenAI models.
Google Cloud Docs
Gemini 3 Flash Model Specifications [cite: 28]
June 2026
Official Google Material
Documented context window and media parameters.
Developers Digest
Gemini 3.5 Pro Developer Guide [cite: 25]
July 9, 2026
Third-Party
Documented standard and long context pricing structures.
Elephas
NotebookLM Source Limits [cite: 12]
June 2026
Third-Party
Compared private Mac tools with NotebookLM’s server limits.
Elephas
NotebookLM Daily Limits [cite: 13]
June 2026
Third-Party
Documented rolling 24-hour limit resets.
Atlas Workspace
Gemini Notebook Limitations [cite: 4]
August 10, 2026
Third-Party
Tabulated limits per user tier and notebook partition risks.
OpenAI Forum
Custom GPT Limits [cite: 50]
2025
Third-Party
Documented instruction lengths and Action slots in ChatGPT.
TechPoint Africa
ChatGPT Deep Research Guide [cite: 17]
Early 2025
Third-Party
Outlined standard task limits and prompt limits.
Data Studios
Perplexity AI Deep Research Limits [cite: 35]
2026
Third-Party
Documented Perplexity query length capacities and reasoning loop steps.
Google DeepMind
Gemini 3 Flash Model Card [cite: 27]
December 2025
Official Google Material
Documented ML Pathways and hardware TPU training data.
Google AI Discuss
Deep Research API Hanging Forum [cite: 41]
March 12, 2026
Official / Third-Party Forum
Documented JS SDK polling timeouts and hanging behaviors.
TechPoint Africa
Gemini Deep Research App limits [cite: 17]
Early 2025
Third-Party
Identified Gemini 2.5 Pro app integrations and prompt behaviors.
--------------------------------------------------------------------------------
Discarded
A total of 46 sources were read but excluded from active citation. Exclusions were determined by three primary criteria:
Information Redundancy: A large number of secondary blog posts, community threads, and introductory tutorials repeated basic pricing structures and source tables (such as the standard 50-source free limit) without adding technical context or documentation regarding agent execution or grounding architectures.
Relevance Scope: Multiple sources focused on user-interface configurations, standard Gemini conversational prompt tips, or unrelated tools (such as general Google Workspace administration) rather than source ingestion mechanics, context windows, or deep research planning models.
Low-Quality Content Signals: Material from standard SEO-driven lists, affiliate marketing portals, undated guides, and promotional AI newsletters were excluded due to a lack of verifiable technical details or direct references to official developer documentation. These materials failed to meet the verification standards required for professional technical reference.
--------------------------------------------------------------------------------
NotebookLM is now Gemini Notebook - Google Blog, https://blog.google/innovation-and-ai/products/gemini-notebook/notebooklm-gemini-notebook/
Add or discover new sources for your notebook - Computer - Google Help, https://support.google.com/gemininotebook/answer/16215270?hl=en&co=GENIE.Platform%3DDesktop
Upgrade Gemini Notebook - Google Help, https://support.google.com/gemininotebook/answer/16213268?hl=en
NotebookLM Limitations (2026): Current Limits & Pitfalls - Atlas, https://www.atlasworkspace.ai/blog/notebooklm-limitations
NotebookLM Review 2026: 300 Sources Per Notebook, Audio Overviews, and What Google's AI Research Tool Replaces - Value Add VC, https://valueaddvc.com/blog/notebooklm-review-2026-300-sources-per-notebook-audio-overviews-and-what-googles-ai-research-tool-replaces
Gemini Notebook (NotebookLM): Google's Source-Grounded AI Research Assistant, https://www.university-365.com/post/gemini-notebook-notebooklm-google-s-source-grounded-ai-research-assistant
What is Gemini Notebook Enterprise? - Google Cloud Documentation, https://docs.cloud.google.com/gemini/enterprise/notebooklm-enterprise/docs/overview
notebooklm-py/docs/quota-limits.md at main - GitHub, https://github.com/teng-lin/notebooklm-py/blob/main/docs/quota-limits.md
Add or Discover New Sources in NotebookLM - The New School, https://services.newschool.edu/TDClient/32/Portal/KB/ArticleDet?ID=1371
Frequently asked questions - Gemini Notebook Help - Google Help, https://support.google.com/gemininotebook/answer/16269187?hl=en
NotebookLM Features & Limit... - The New School, https://services.newschool.edu/TDClient/32/Portal/KB/Article/1374/NotebookLM-Features-Limitations
NotebookLM (Gemini Notebook) Limits: Sources & Notebooks by Plan - Elephas, https://elephas.app/blog/notebooklm-source-limits
NotebookLM Daily Limits 2026: Gemini Notebook Caps & Reset Times - Elephas, https://elephas.app/blog/notebooklm-daily-limit
NotebookLM Pricing 2025: Free Plan vs Paid Plan — Which One Actually Saves You Time?, https://www.elite.cloud/post/notebooklm-pricing-2025-free-plan-vs-paid-plan-which-one-actually-saves-you-time/
Build with Gemini Deep Research - Google Blog, https://blog.google/innovation-and-ai/technology/developers-tools/deep-research-agent-gemini-api/
How to Use Gemini Deep Research for Competitive Intelligence and Market Reports, https://www.mindstudio.ai/blog/gemini-deep-research-competitive-intelligence
I tried ChatGPT deep research—here's what happened and how to make it work for you, https://techpoint.africa/guide/chatgpt-deep-research/
Gemini API: Deep Research Agent - Google Colab, https://colab.research.google.com/github/google-gemini/cookbook/blob/main/quickstarts/Get_started_Deep_Research.ipynb
Gemini Deep Research agent | Gemini API | Google AI for Developers, https://ai.google.dev/gemini-api/docs/deep-research
Try Deep Research and our new experimental model in Gemini, your AI assistant, https://blog.google/products-and-platforms/products/gemini/google-gemini-deep-research/
Our next-generation model: Gemini 1.5 - Google Blog, https://blog.google/innovation-and-ai/products/google-gemini-next-generation-model-february-2024/
Architecting the Future of Research: A Technical Deep-Dive into NotebookLM and Gemini Integration - DEV Community, https://dev.to/jubinsoni/architecting-the-future-of-research-a-technical-deep-dive-into-notebooklm-and-gemini-integration-m60
Google / NotebookLLM: Source-Grounded LLM Assistant with Multi-Modal Output Capabilities - ZenML LLMOps Database, https://www.zenml.io/llmops-database/source-grounded-llm-assistant-with-multi-modal-output-capabilities
Gemini 3.5 Pro vs GPT-5.6 Sol: What to Expect from Google's Next Frontier Model, https://www.mindstudio.ai/blog/gemini-3-5-pro-vs-gpt-5-6-sol-comparison
Gemini 3.5 Pro Developer Guide: 2M Context Window and Deep Think Mode, https://www.developersdigest.tech/blog/gemini-3-5-pro-developer-guide-2026
What's new in Gemini 3.5 Flash - Interactions API | Google AI for Developers, https://ai.google.dev/gemini-api/docs/whats-new-gemini-3.5
Gemini 3.5 Flash - Model Card - Google DeepMind, https://deepmind.google/models/model-cards/gemini-3-5-flash/
Gemini 3 Flash | Gemini Enterprise Agent Platform | Google Cloud Documentation, https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/gemini/3-flash
File search - Interactions API | Google AI for Developers, https://ai.google.dev/gemini-api/docs/file-search
Claude vs NotebookLM: Research AI vs Chat AI 2026 | LOW/CODE - LowCode Agency, https://www.lowcode.agency/blog/claude-vs-notebooklm
Use chat in Gemini Notebook - Google Help, https://support.google.com/gemininotebook/answer/16179559?hl=en
What Is Deep Research And How It Works? - NewsCatcher, https://www.newscatcherapi.com/blog-posts/what-is-deep-research
Create detailed reports with Deep Research | Google Workspace Blog, https://workspace.google.com/blog/ai-and-machine-learning/meet-deep-research-your-new-ai-research-assistant
DeepSearchQA: Bridging the Comprehensiveness Gap for Deep Research Agents - arXiv, https://arxiv.org/html/2601.20975v1
Perplexity AI Deep Research: How It Works, Limitations, and Use Cases for Professionals, https://www.datastudios.org/post/perplexity-ai-deep-research-how-it-works-limitations-and-use-cases-for-professionals
Most NotebookLM users skip the configuration step entirely — these 5 settings change everything - MakeUseOf, https://www.makeuseof.com/notebooklm-settings-configure-notebook/
NotebookLM just supercharged custom chats with a new upgrade - Android Authority, https://www.androidauthority.com/notebooklm-chat-customization-upgrade-3622570/
I tested NotebookLM's new 10000 character update here's what actually changed - Reddit, https://www.reddit.com/r/notebooklm/comments/1rvcjwy/i_tested_notebooklms_new_10000_character_update/
NotebookLM: How I Reduced Cognitive Load With Custom AI Personas - Medium, https://medium.com/@kombib/notebooklm-how-i-reduced-cognitive-load-with-custom-ai-personas-50100ec93213
Gemini Deep Research Agent - Google Cloud Documentation, https://docs.cloud.google.com/gemini-enterprise-agent-platform/agents/google/deep-research
Deep Research API (deep-research-pro-preview-12-2025) — jobs stay in_progress indefinitely with complex prompts - Gemini API - Google AI Developers Forum, https://discuss.ai.google.dev/t/deep-research-api-deep-research-pro-preview-12-2025-jobs-stay-in-progress-indefinitely-with-complex-prompts/130832
Manage your Gemini Notebook usage limits - Computer - Google Help, https://support.google.com/gemininotebook/answer/17670842?hl=en&co=GENIE.Platform%3DDesktop
Do better research with NotebookLM - Google Blog, https://blog.google/innovation-and-ai/products/notebooklm/better-research-notebooklm/
A new era of intelligence with Gemini 3 - Google Blog, https://blog.google/products-and-platforms/products/gemini/gemini-3/
Deep Research - Glean Docs, https://docs.glean.com/user-guide/assistant/deep-research
Gemini 3 Pro: the frontier of vision AI - Google Blog, https://blog.google/innovation-and-ai/technology/developers-tools/gemini-3-pro-vision/
Perplexity vs Gemini for Research, Search, and Source Checks - Atlas, https://www.atlasworkspace.ai/blog/perplexity-vs-gemini
Try notebooks in Gemini to easily keep track of projects - Google Blog, https://blog.google/innovation-and-ai/products/gemini-app/notebooks-gemini-notebooklm/
Interactions API: our primary interface for Gemini models and agents - Google Blog, https://blog.google/innovation-and-ai/technology/developers-tools/interactions-api-general-availability/
Custom GPT Limits and Overcoming them - OpenAI Developer Community, https://community.openai.com/t/custom-gpt-limits-and-overcoming-them/1061473