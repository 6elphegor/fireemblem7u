	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043700
sub_08043700: @ 0x08043700
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	ldr r0, _08043774 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043724
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _08043724
	subs r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl SioPlaySoundEffect
_08043724:
	ldr r0, _08043774 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043742
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bgt _08043742
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl SioPlaySoundEffect
_08043742:
	ldr r0, _08043774 @ =0x08B857F8
	ldr r1, [r0]
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043782
	ldr r0, _08043778 @ =0x02000C04
	adds r0, #1
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804377C
	movs r0, #2
	bl SioPlaySoundEffect
	str r6, [r4, #0x50]
	ldr r0, [r4, #0x44]
	str r0, [r5, #0x60]
	adds r0, r5, #0
	bl Proc_Break
	b _08043782
	.align 2, 0
_08043774: .4byte 0x08B857F8
_08043778: .4byte 0x02000C04
_0804377C:
	movs r0, #0
	bl SioPlaySoundEffect
_08043782:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
