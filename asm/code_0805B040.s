	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B040
sub_0805B040: @ 0x0805B040
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B094 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B098 @ =0x08BA29C0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B09C @ =0x081E8A06
	str r0, [r5, #0x48]
	ldr r0, _0805B0A0 @ =0x08BA2A84
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B0A4 @ =0x08BA2A78
	str r0, [r5, #0x54]
	ldr r0, _0805B0A8 @ =0x0823E2F4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805B0AC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B0BA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B0B0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805B0BA
	.align 2, 0
_0805B094: .4byte 0x0201774C
_0805B098: .4byte 0x08BA29C0
_0805B09C: .4byte 0x081E8A06
_0805B0A0: .4byte 0x08BA2A84
_0805B0A4: .4byte 0x08BA2A78
_0805B0A8: .4byte 0x0823E2F4
_0805B0AC: .4byte 0x0203E02C
_0805B0B0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805B0BA:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
