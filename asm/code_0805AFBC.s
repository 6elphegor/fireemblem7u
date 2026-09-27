	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AFBC
sub_0805AFBC: @ 0x0805AFBC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B010 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B014 @ =0x08BA29C0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B018 @ =0x081E8998
	str r0, [r5, #0x48]
	ldr r0, _0805B01C @ =0x08BA2A28
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B020 @ =0x08BA29D8
	str r0, [r5, #0x54]
	ldr r0, _0805B024 @ =0x0823E2F4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805B028 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B036
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B02C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805B036
	.align 2, 0
_0805B010: .4byte 0x0201774C
_0805B014: .4byte 0x08BA29C0
_0805B018: .4byte 0x081E8998
_0805B01C: .4byte 0x08BA2A28
_0805B020: .4byte 0x08BA29D8
_0805B024: .4byte 0x0823E2F4
_0805B028: .4byte 0x0203E02C
_0805B02C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805B036:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
