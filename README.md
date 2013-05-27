URL extraction and pagerank mapreduce jobs on CommonCrawl(http://commoncrawl.org) dataset
--

Test URL extraction locally:
```bash
chmod +x url_parsing/crawl_mapper.rb
chmod +x url_parsing/crawl_reducer.rb

cat sample_input | ./url_parsing/crawl_mapper.rb | ./url_parsing/crawl_reducer.rb > result
```

Running Amazon Elastic MapReduce jobs
--
* Input location: s3://aws-publicdatasets/common-crawl/parse-output/segment/1346823846150/metadata-*
* Output location: s3://../output
* Mapper: s3://.../crawl_mapper.rb
* Reducer: s3://.../crawl_reducer.rb
* Extra args: -inputformat SequenceFileAsTextInputFormat
* Custom Bootstrap action: s3://.../setup.sh

Commoncrawl Metadata
--

Metadata file is about 16MB each.
To get the list of valid segments:
```bash
aws get aws-publicdatasets/common-crawl/parse-output/valid_segments.txt
```

URL extraction
--

Information about http://www.neti.ee/cgi-bin/serverid:
```json
{
  "url": "http://www.neti.ee/cgi-bin/serverid",
  "arcFileParition": 584,
  "arcSourceSegmentId": 1346823846150,
  "arcFileDate": 1346832062332,
  "compressedSize": 524596,
  "arcFileOffset": 8186060
}
```

PageRank calculation
--

```bash
chmod +x page_rank/page_rank_mapper.rb
chmod +x page_rank/page_rank_reducer.rb

cat sample_input | ./page_rank/page_rank_mapper.rb | sort | ./page_rank/page_rank_reducer.rb > result
```