	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041610
sub_08041610: @ 0x08041610
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl sub_08041584
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x18
	bl PutUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq _0804164A
	movs r0, #3
	bl SioPlaySoundEffect
_0804164A:
	ldr r4, _08041688 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041664
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r6, #0
	bl Proc_Break
_08041664:
	ldr r1, [r4]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804167E
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0804167E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041688: .4byte 0x08B857F8
