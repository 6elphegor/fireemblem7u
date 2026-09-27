	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFenrirOBJ2Chiri
StartSubSpell_efxFenrirOBJ2Chiri: @ 0x0805C8F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0805C930 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C934 @ =0x08BA3038
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, _0805C938 @ =0x08BA3050
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0805C93C
	cmp r0, #1
	beq _0805C944
	b _0805C950
	.align 2, 0
_0805C930: .4byte 0x0201774C
_0805C934: .4byte 0x08BA3038
_0805C938: .4byte 0x08BA3050
_0805C93C:
	ldr r0, _0805C940 @ =0x08BBB568
	b _0805C946
	.align 2, 0
_0805C940: .4byte 0x08BBB568
_0805C944:
	ldr r0, _0805C96C @ =0x08BBB594
_0805C946:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
_0805C950:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C96C: .4byte 0x08BBB594
