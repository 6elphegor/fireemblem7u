	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMapFillEdges
BmMapFillEdges: @ 0x08019108
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _08019170 @ =0x0202E3D8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r4, r1
	bge _0801913C
	adds r5, r7, #0
	adds r2, r6, #0
_08019122:
	ldr r0, [r2]
	strb r3, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldm r2!, {r1}
	adds r0, r0, r1
	subs r0, #1
	strb r3, [r0]
	adds r4, #1
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r4, r0
	blt _08019122
_0801913C:
	movs r1, #0
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r1, r0
	bge _08019168
	adds r2, r7, #0
_08019148:
	ldr r0, [r6]
	adds r0, r0, r1
	strb r3, [r0]
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r6
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
	adds r1, #1
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r1, r0
	blt _08019148
_08019168:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019170: .4byte 0x0202E3D8
