	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxShineBG2
StartSubSpell_efxShineBG2: @ 0x0805F0DC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F138 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F13C @ =0x08BA36E4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805F140 @ =0x081E9250
	str r0, [r5, #0x48]
	ldr r0, _0805F144 @ =0x08BA36FC
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805F148 @ =0x08290954
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805F14C @ =0x08290678
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805F150 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F15E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F154
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805F15E
	.align 2, 0
_0805F138: .4byte 0x0201774C
_0805F13C: .4byte 0x08BA36E4
_0805F140: .4byte 0x081E9250
_0805F144: .4byte 0x08BA36FC
_0805F148: .4byte 0x08290954
_0805F14C: .4byte 0x08290678
_0805F150: .4byte 0x0203E02C
_0805F154:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805F15E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
