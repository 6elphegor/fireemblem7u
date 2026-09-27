	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadChapterTraps
LoadChapterTraps: @ 0x080345EC
	push {r4, r5, lr}
	sub sp, #4
	bl sub_080791F0
	adds r5, r0, #0
	b _0803468A
_080345F8:
	ldrb r0, [r5]
	subs r1, r0, #1
	adds r2, r0, #0
	cmp r1, #0xa
	bhi _08034688
	lsls r0, r1, #2
	ldr r1, _0803460C @ =_08034610
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803460C: .4byte _08034610
_08034610: @ jump table
	.4byte _0803463C @ case 0
	.4byte _08034688 @ case 1
	.4byte _08034688 @ case 2
	.4byte _08034648 @ case 3
	.4byte _08034656 @ case 4
	.4byte _08034688 @ case 5
	.4byte _08034688 @ case 6
	.4byte _08034668 @ case 7
	.4byte _08034672 @ case 8
	.4byte _08034688 @ case 9
	.4byte _0803467E @ case 10
_0803463C:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddBallista
	b _08034688
_08034648:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #4]
	ldrb r3, [r5, #5]
	bl AddFireTile
	b _08034688
_08034656:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGasTrap
	b _08034688
_08034668:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	bl AddTrap8
	b _08034688
_08034672:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddTrap9
	b _08034688
_0803467E:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	movs r3, #0
	bl AddTrap
_08034688:
	adds r5, #6
_0803468A:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080345F8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
