	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_PostMainMenu
GC_PostMainMenu: @ 0x080127E8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080128A8
	lsls r0, r0, #2
	ldr r1, _08012800 @ =_08012804
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012800: .4byte _08012804
_08012804: @ jump table
	.4byte _08012828 @ case 0
	.4byte _08012828 @ case 1
	.4byte _08012828 @ case 2
	.4byte _08012828 @ case 3
	.4byte _08012878 @ case 4
	.4byte _08012882 @ case 5
	.4byte _0801288C @ case 6
	.4byte _08012896 @ case 7
	.4byte _080128A0 @ case 8
_08012828:
	bl GetNextChapterStatsEntry
	cmp r0, #0xb
	bne _0801283A
	adds r0, r4, #0
	movs r1, #0x14
	bl Proc_Goto
	b _080128A8
_0801283A:
	bl GetTacticianName
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801286A
	ldr r1, _0801285C @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08012860
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080128A8
	.align 2, 0
_0801285C: .4byte 0x0202BBF8
_08012860:
	ldr r0, _08012874 @ =0x0000055B
	bl DecodeMsg
	bl SetTacticianName
_0801286A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080128A8
	.align 2, 0
_08012874: .4byte 0x0000055B
_08012878:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080128A8
_08012882:
	adds r0, r4, #0
	movs r1, #0x16
	bl Proc_Goto
	b _080128A8
_0801288C:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080128A8
_08012896:
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080128A8
_080128A0:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
_080128A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
