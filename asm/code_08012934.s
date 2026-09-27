	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012934
sub_08012934: @ 0x08012934
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllMus
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08012992
	lsls r0, r0, #2
	ldr r1, _08012950 @ =_08012954
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012950: .4byte _08012954
_08012954: @ jump table
	.4byte _0801296C @ case 0
	.4byte _08012992 @ case 1
	.4byte _08012976 @ case 2
	.4byte _08012980 @ case 3
	.4byte _0801298A @ case 4
	.4byte _0801298A @ case 5
_0801296C:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08012992
_08012976:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _08012992
_08012980:
	adds r0, r4, #0
	movs r1, #0x13
	bl Proc_Goto
	b _08012992
_0801298A:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_08012992:
	pop {r4}
	pop {r0}
	bx r0
