	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058BAC
sub_08058BAC: @ 0x08058BAC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058C00 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058C04 @ =0x08BA1C6C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058C08 @ =0x081E83E6
	str r0, [r5, #0x48]
	ldr r0, _08058C0C @ =0x08BA1C84
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08058C10 @ =0x08BA1CB0
	str r0, [r5, #0x54]
	ldr r0, _08058C14 @ =0x08213E80
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08058C18 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08058C26
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08058C1C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08058C26
	.align 2, 0
_08058C00: .4byte 0x0201774C
_08058C04: .4byte 0x08BA1C6C
_08058C08: .4byte 0x081E83E6
_08058C0C: .4byte 0x08BA1C84
_08058C10: .4byte 0x08BA1CB0
_08058C14: .4byte 0x08213E80
_08058C18: .4byte 0x0203E02C
_08058C1C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08058C26:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
