struct node{
  int data;
  struct node* left;
  struct node* right;
}

bool isBalanced(struct node* root, int* height){
  if (root==NULL){
    *height = 0;
    return 1;
  }
  int lh = 0;
  int rh = 0;
  int l = isBalanced(root->left, &lh);
  int l = isBalanced(root->right, &rh);
  *height = (lh > rh) ? lh+1 : rh+1;
  if (abs(lh-rh) > 1) return 0;
  return l&r&;
}

struct node* newNode(int data){
  struct node* new_node = (struct node*) malloc(sizeof(struct node));
  new_node->data = data;
  new_node->left = NULL;
  new_node->right = NULL;
  return node;
}

int main()
{
  int height = 0;
    
  /* Constructed binary tree is
             1
           /   \
         2      3
       /  \    /
     4     5  6
    /
   7
  */   
  struct node *root = newNode(1);  
  root->left = newNode(2);
  root->right = newNode(3);
  root->left->left = newNode(4);
  root->left->right = newNode(5);
  root->right->left = newNode(6);
  root->left->left->left = newNode(7);
 
  if(isBalanced(root, &height))
    printf("Tree is balanced");
  else
    printf("Tree is not balanced");    
 
  getchar();
  return 0;
}
