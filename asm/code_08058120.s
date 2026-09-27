	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxThunderBG
NewEfxThunderBG: @ 0x08058120
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058178 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805817C @ =0x08BA19F4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058180 @ =0x081E824E
	str r0, [r5, #0x48]
	ldr r0, _08058184 @ =0x08BA1A0C
	str r0, [r5, #0x4c]
	ldr r0, _08058188 @ =0x08BA1A14
	str r0, [r5, #0x50]
	ldr r0, _0805818C @ =0x081FB4B4
	movs r1, #0x86
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08058190 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805819E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08058194
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805819E
	.align 2, 0
_08058178: .4byte 0x0201774C
_0805817C: .4byte 0x08BA19F4
_08058180: .4byte 0x081E824E
_08058184: .4byte 0x08BA1A0C
_08058188: .4byte 0x08BA1A14
_0805818C: .4byte 0x081FB4B4
_08058190: .4byte 0x0203E02C
_08058194:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805819E:
	pop {r4, r5}
	pop {r0}
	bx r0
