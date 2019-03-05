## A project written in 2017

It is a question-answering system for the field of vehicle maintenance, using Spring-SpringMVC-Mybatis backend framework, Bootstrap front-end framework and Mysql structured database.

### The core business of the system:

1. A user inputs a question about vehicle maintenance in natural language;
2. The system reprocess the question and segment it into several words;
3. The similarity is calculated between these words and the phrases in the database;
4. The system returns the three answers with the highest similarity value to the user.

### The processing of the knowledge database:

1. search domain knowledge on websites;
2. collect and save url,title,content into database;
3. segment each content into phrases;
4. extract 5 phrases as keywords from each content and save them as an attribute value;
5. attributes in the database: id,url,title,keywords,content.

### Models and tools used:
1. segmentation--HMM,CRF; tool--ansj
2. get knowledge from websites--WebCollectCrawler; tool--WebCollectCrawler
3. keyword extraction--TFIDF; tool--ansj
4. similarity calculation--word2vec; tool--word2vec

### About programming and implementation:

For professional and experienced programmers, my code is confusing, sometimes, even I myself cannot understand what I was writing. Actually I don't have so much experience in programming, and it was my first time completely and systematically developing a system on my own. You need to configure software development environment, get familiar with the development language, understand the development framework and development process. You also need to apply different model codes to your own system in order to support the business process.

Now I am reviewing this project and realize that my programming ability is quite immature. However, it was my precious experience because I  have learned a lot from this project even if I was weak at programming. I think I will learn harder to keep up with the ever-changing computer language, and I guess I will learn faster and more easily on the basis of this project.

```
- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/zdfan1007/QAS/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
