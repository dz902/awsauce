# vpc-checklist

A list of things to note when you deal with VPCs.

## the checklist

- Make sure you have less than 5 VPC's in your selected region.
  - Our newly create stacks will create a dedicated VPC, so you can easily
    tear it down when no longer needed, but there is a soft limit of 5 VPC's
    per region