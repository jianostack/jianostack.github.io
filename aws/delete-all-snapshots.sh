snapshots=$(aws ec2 describe-snapshots --owner-ids self --query 'Snapshots[*].SnapshotId' --output text)
for snapshot in $snapshots; do
  aws ec2 delete-snapshot --snapshot-id $snapshot
  echo "Successfully deleted snapshot $snapshot"
done
