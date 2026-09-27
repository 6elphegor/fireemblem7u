	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035838
sub_08035838: @ 0x08035838
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #5
	bhi _08035898
	lsls r0, r0, #2
	ldr r1, _0803584C @ =_08035850
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803584C: .4byte _08035850
_08035850: @ jump table
	.4byte _08035868 @ case 0
	.4byte _08035872 @ case 1
	.4byte _0803587A @ case 2
	.4byte _08035882 @ case 3
	.4byte _0803588A @ case 4
	.4byte _08035892 @ case 5
_08035868:
	ldrb r3, [r3]
	cmp r3, r2
	bls _08035898
_0803586E:
	movs r0, #1
	b _0803589A
_08035872:
	ldrb r3, [r3]
	cmp r3, r2
	blo _08035898
	b _0803586E
_0803587A:
	ldrb r0, [r3]
	cmp r0, r2
	bne _08035898
	b _0803586E
_08035882:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _08035898
	b _0803586E
_0803588A:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _08035898
	b _0803586E
_08035892:
	ldrb r0, [r3]
	cmp r0, r2
	bne _0803586E
_08035898:
	movs r0, #0
_0803589A:
	bx lr
