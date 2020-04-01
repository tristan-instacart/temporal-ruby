module Cadence
  class Activity
    class Metadata
      attr_reader :id, :task_token, :attempt, :workflow_run_id, :workflow_id, :workflow_name, :headers

      def self.from_task(task)
        new(
          id: task.activityId,
          task_token: task.taskToken,
          attempt: task.attempt,
          workflow_run_id: task.workflowExecution.runId,
          workflow_id: task.workflowExecution.workflowId,
          workflow_name: task.workflowType.name,
          headers: task.header&.fields || {}
        )
      end

      def initialize(id:, task_token:, attempt:, workflow_run_id:, workflow_id:, workflow_name:, headers: {})
        @id = id
        @task_token = task_token
        @attempt = attempt
        @workflow_run_id = workflow_run_id
        @workflow_id = workflow_id
        @workflow_name = workflow_name
        @headers = headers

        freeze
      end
    end
  end
end
