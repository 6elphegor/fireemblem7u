	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805DFAC
sub_0805DFAC: @ 0x0805DFAC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805E00C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E010 @ =0x08BA32EC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805E014 @ =0x081E8FFE
	str r0, [r5, #0x48]
	ldr r0, _0805E018 @ =0x08BA3304
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805E01C @ =0x08272D9C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805E020 @ =0x08270E90
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805E024 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E032
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E028
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805E032
	.align 2, 0
_0805E00C: .4byte 0x0201774C
_0805E010: .4byte 0x08BA32EC
_0805E014: .4byte 0x081E8FFE
_0805E018: .4byte 0x08BA3304
_0805E01C: .4byte 0x08272D9C
_0805E020: .4byte 0x08270E90
_0805E024: .4byte 0x0203E02C
_0805E028:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805E032:
	pop {r4, r5}
	pop {r0}
	bx r0
