local GH_ISSUE = ':GhIssue '
local GH_PR = ':GhPR '
local git = require 'muryp-git.api'

_G.MAP({
  name = '+GIT(VCS)',
  h = {
    name = '+GH_CLI',
    i = {
      name = '+GH_ISSUE',
      c = {
        name = '+CACHE',
        f = { ':Telescope gh_issue_cache<CR>', 'LIST_ISSUE_ON_CACHE_FILE' },
        r = { ':Telescope gh_issue_cache_rg<CR>', 'LIST_ISSUE_ON_CACHE_RG' },
      },
      i = { ':Telescope gh_issue<CR>', 'EDIT_ISSUE' },
      o = {
        name = '+GET_ISSUE_BY_NUM',
        o = { GH_ISSUE .. 'getByNum true<CR>', 'online' },
        c = { GH_ISSUE .. 'getByNum false<CR>', 'offline' },
      },
      a = { ':term gh issue create<CR>', 'ADD_ISSUE' },
      s = { GH_ISSUE .. 'push<CR>', 'SYNC_LOCAL_TO_GH' },
      S = { GH_ISSUE .. 'update<CR>', 'SYNC_GH_TO_LOCAL' },
      e = { GH_ISSUE .. 'edit<CR>', 'EDIT' },
      d = { GH_ISSUE .. 'rm<CR>', 'DELETE' },
      p = { GH_ISSUE .. 'pin<CR>', 'pin' },
      P = { GH_ISSUE .. 'unpin<CR>', 'unpin' },
      l = { GH_ISSUE .. 'lock<CR>', 'lock' },
      L = { GH_ISSUE .. 'unlock<CR>', 'unlock' },
      r = { GH_ISSUE .. 'reopen<CR>', 'reopen' },
      C = { GH_ISSUE .. 'closed<CR>', 'closed' },
    },
    p = {
      name = '+PR',
      c = {
        name = '+LIST_CACHE',
        f = { ':Telescope gh_pr_cache<CR>', 'LIST_ISSUE_ON_CACHE_FILE' },
        r = { ':Telescope gh_pr_cache_rg<CR>', 'LIST_ISSUE_ON_CACHE_RG' },
      },
      m = { GH_PR .. 'merge<CR>', 'MERGE' },
      M = { GH_PR .. 'currMerge<CR>', 'CURR_MERGE' },
      i = { ':Telescope gh_pr<CR>', 'LIST_PR' },
      o = {
        name = '+GET_ISSUE_BY_NUM',
        o = { GH_PR .. 'getByNum true<CR>', 'online' },
        c = { GH_PR .. 'getByNum false<CR>', 'offline' },
      },
      a = { GH_PR .. 'create true<CR>', 'ADD_PR_W_MSG' },
      A = { GH_PR .. 'create false<CR>', 'ADD_ISSUE_NO_MSG' },
      s = { GH_PR .. 'push<CR>', 'SYNC_LOCAL_TO_GH' },
      S = { GH_PR .. 'update<CR>', 'SYNC_GH_TO_LOCAL' },
      e = { GH_PR .. 'edit<CR>', 'EDIT_PR' },
      d = { GH_PR .. 'rm<CR>', 'DELETE' },
      p = { GH_PR .. 'pin<CR>', 'pin' },
      P = { GH_PR .. 'unpin<CR>', 'unpin' },
      l = { GH_PR .. 'lock<CR>', 'lock' },
      L = { GH_PR .. 'unlock<CR>', 'unlock' },
      r = { GH_PR .. 'reopen<CR>', 'reopen' },
      C = { GH_PR .. 'closed<CR>', 'closed' },
    },
    m = {
      name = '+MILESTONE',
      c = { ':GhMilestone create<CR>', 'CREATE' },
      l = { ':GhMilestone list<CR>', 'LIST' },
      d = { ':GhMilestone rm<CR>', 'DELETE' },
      e = { ':GhMilestone edit<CR>', 'EDIT' },
    },
  },
  g = {
    name = 'GIT',
    b = {
      name = '+BRANCH',
      c = { ':Telescope git_branches<CR>', 'CHECKOUT' },
      a = { git.branch.create, 'CREATE' },
      r = { git.branch.renameCurr, 'RENAME_CURR' },
      R = { git.branch.renameList, 'RENAME_LIST' },
      d = { git.branch.rm, 'REMOVE' },
    },
    g = { ':term grb', 'BRANCH' },
    -- u = {
    --   function()
    --     git.revert1(true)
    --   end,
    --   'REVERT1',
    -- },
    -- U = {
    --   function()
    --     git.revert2(true)
    --   end,
    --   'REVERT2',
    -- },
    f = {
      name = 'FLOW',
      r = {
        function()
          git.flow { isRebase = true }
        end,
        'FLOW_REBASE',
      },
      m = {
        function()
          git.flow { isMerge = true }
        end,
        'FLOW_MERGE',
      },
      s = {
        function()
          git.flow { isSquash = true }
        end,
        'FLOW_SQUASH',
      },
    },
    F = {
      function()
        git.browse()
      end,
      'FIND_FILE_IN_LOG',
    },
    s = { ':Telescope git_status<CR>', 'GIT_STATUS' },
    c = { ':term git commit<CR>', 'COMMIT' },
    a = { ':term git commit --amend<CR>', 'COMMIT_AMEND' },
    v = {
      function()
        git.commit { isAddAll = true }
      end,
      'ADD_ALL+COMMIT',
    },
    p = {
      name = 'PUSH',
      a = {
        function()
          git.push {
            isUseSsh = true,
            isPull = true,
            isCommit = true,
            isAddAll = true,
          }
        end,
        'WITH_ALL',
      },
      c = {
        function()
          git.push {
            isUseSsh = true,
            isCommit = true,
          }
        end,
        'WITH_COMMIT',
      },
      p = {
        function()
          git.push {
            isUseSsh = true,
          }
        end,
        'PUSH',
      },
      r = {
        function()
          git.push {
            isUseSsh = true,
            isPull = true,
            isCommit = true,
          }
        end,
        'WITH_PULL',
      },
    },
    m = {
      name = '+MERGE',
      m = {
        git.merge,
        'MERGE',
      },
      s = {
        git.squash,
        'SQUASH',
      },
      r = {
        git.rebase,
        'REBASE',
      },
    },
    P = {
      name = 'PULL',
      P = {
        function()
          git.pull {
            isUseSsh = true,
          }
        end,
        'WITH_SSH',
      },
      r = {
        function()
          git.pull {
            isUseSsh = true,
          }
        end,
        'WITH_SSH_REBASE',
      },
      s = {
        function()
          git.pull {
            isUseSsh = true,
          }
        end,
        'WITH_SSH_SQUASE',
      },
      m = {
        function()
          git.pull {
            isUseSsh = true,
          }
        end,
        'WITH_SSH_merge',
      },
    },
    d = {
      name = 'DIFF_VIEW',
      o = { ':DiffviewOpen<CR>', 'DIFF_OPEN' },
      q = { ':DiffviewClose<CR>', 'DIFF_CLOSE' },
      t = { ':DiffviewFileHistory<CR>', 'FILE_HISTORY' },
      f = { require('telescope').extensions.git_diffs.diff_commits, 'FILE_HISTORY' },
    },
    B = { ':Gitsigns blame_line<CR>', 'BLAME_LINE' },
    C = {
      name = 'CONFLICT',
      l = { ':GitConflictListQf<CR>', 'LIST' },
      r = { ':GitConflictRefresh<CR>', 'REFRES' },
      n = { ':GitConflictNextConflict<CR>', 'NEXT' },
      p = { ':GitConflictPrevConflict<CR>', 'PREV' },
      t = { ':GitConflictChooseTheirs<CR>', 'CHOOSE_THEIR' },
      b = { ':GitConflictChooseBoth<CR>', 'CHOOSE_BOTH' },
      o = { ':GitConflictChooseOur<CR>', 'CHOOSE_OUR' },
      N = { ':GitConflictChooseNone<CR>', 'CHOOSE_NONE' },
    },
    r = {
      name = '+REMOTE',
      r = { git.remote.rm, 'REMOVE' },
      c = { git.remote.changeUrl, 'CHANGE_URL' },
      a = { git.remote.add, 'ADD' },
      y = { git.remote.copy, 'COPY' },
      s = { git.remote.show, 'SHOW' },
      u = { git.remote.httpToSsh, 'HTTP_TO_SSH' },
      U = { git.remote.sshToHttp, 'SSH_TO_HTTP' },
      n = { git.remote.rename, 'RENAME' },
      o = { git.remote.open, 'OPEN' },
    },
  },
}, { prefix = '<leader>g', noremap = true, mode = 'n', silent = true })