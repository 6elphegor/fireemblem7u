	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F710
sub_0803F710: @ 0x0803F710
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _0803F790 @ =0x08B857F8
	ldr r1, [r6]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F72E
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl sub_0803F584
_0803F72E:
	ldr r1, [r6]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F744
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl sub_0803F584
_0803F744:
	ldr r1, [r6]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F75A
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl sub_0803F584
_0803F75A:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F770
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	bl sub_0803F584
_0803F770:
	ldr r1, [r6]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F7B6
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #4
	beq _0803F7A4
	cmp r0, #4
	bgt _0803F794
	cmp r0, #0
	beq _0803F79A
	b _0803F7B6
	.align 2, 0
_0803F790: .4byte 0x08B857F8
_0803F794:
	cmp r0, #5
	beq _0803F7AE
	b _0803F7B6
_0803F79A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F5DC
	b _0803F7B6
_0803F7A4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F66C
	b _0803F7B6
_0803F7AE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SaveTactician
_0803F7B6:
	ldr r6, _0803F804 @ =0x08B857F8
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F7CE
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F66C
_0803F7CE:
	ldr r1, [r6]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F7E4
	movs r0, #3
	bl SioPlaySoundEffect
	movs r0, #5
	strh r0, [r4, #0x34]
_0803F7E4:
	ldr r1, [r6]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F820
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F808
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F66C
	b _0803F820
	.align 2, 0
_0803F804: .4byte 0x08B857F8
_0803F808:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F820
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0803F820:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
