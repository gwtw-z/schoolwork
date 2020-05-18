#include <bits/stdc++.h>
using std::cin;
using std::cout;
using std::endl;
using std::string;

const int upper = 20;  //估计树节点数的上界
#define ElementType double

struct TreeNode {
	TreeNode(ElementType w = 0) {
		x = w, left = NULL, right = NULL, code = "";
	}
	ElementType x;
	string code;
	TreeNode* left;
	TreeNode* right;
};
typedef TreeNode* Tree;

class Heap;
typedef Heap* PriorityQueue;

class Heap {
public:
	TreeNode* elements;
	int capacity;
	int size;
	Heap() {
		elements = new TreeNode;
		capacity = 10;
		size = 0;
		
	}
	Heap(int MaxSize, ElementType sentinel) { //第0个元素是哨兵
		capacity = MaxSize;
		size = 0;
		elements = new TreeNode[capacity + 1];
		elements[0].x = sentinel;
	}
	void Insert(TreeNode Node) {
		if (size < capacity) {
			int i;
			for (i = ++size;elements[i / 2].x > Node.x;i = i / 2) {
				elements[i] = elements[i / 2];
			}
			elements[i] = Node;
		}
		else
			cout << "堆已满！" << endl;
	}
	Tree DeleteMin() {

		if (size == 0) {
			cout << "堆为空" << endl;
			return &elements[0];
		}

		int i, child;
		TreeNode LastElement;
		LastElement = elements[size--];
		for (i = 1;i * 2 <= size;i = child) {
			child = i * 2;
			if (child != size && elements[child + 1].x < elements[child].x)
				child++;
			if (LastElement.x > elements[child].x)
				elements[i] = elements[child];
			else
				break;
		}
		elements[i] = LastElement;
		return &elements[1];
	}
	Tree Huffman()
	{
		while (size > 1) {
			Tree T = new TreeNode;
			T->x += elements[1].x;
			T->left = new TreeNode;
			*T->left = elements[1];
			DeleteMin();
			T->x += elements[1].x;
			T->right = new TreeNode;
			*T->right = elements[1];
			DeleteMin();
			Insert(*T);
			delete(T);
		}
		return &elements[1];
	}
};

void codingHuffman(Tree T)
{
	if (T->left != NULL) {
		T->left->code = T->code + "0";
		codingHuffman(T->left);
	}
	if (T->right != NULL) {
		T->right->code = T->code + "1";
		codingHuffman(T->right);
	}
	if (T->left == NULL && T->right == NULL) {
		cout << "权重为" << T->x << "的字符对应的Huffman编码为" << T->code << endl;
	}
}
void LaunchHuffman(Tree T) {
	T->code = "root";

	T->left->code = "0";
	codingHuffman(T->left);

	T->right->code = "1";
	codingHuffman(T->right);
}


int main()
{
	ElementType sentinel = -1;
	PriorityQueue MinQueue = new Heap(10, sentinel);
	int i;
	for (i = 0;i < 10;i++) {
		Tree T = new TreeNode(i);
		MinQueue->Insert(*T);
		delete(T);
	}

	Tree Tr = MinQueue->Huffman();
	LaunchHuffman(Tr);
	return 0;
}