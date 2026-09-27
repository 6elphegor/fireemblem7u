	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062C94
sub_08062C94: @ 0x08062C94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _08062CC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062CCC @ =0x08BA4394
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	cmp r5, #1
	beq _08062CE0
	cmp r5, #1
	blo _08062CD0
	cmp r5, #2
	beq _08062CF0
	cmp r5, #3
	beq _08062D04
	b _08062D1A
	.align 2, 0
_08062CC8: .4byte 0x0201774C
_08062CCC: .4byte 0x08BA4394
_08062CD0:
	ldr r0, _08062CD8 @ =0x081E96BC
	str r0, [r4, #0x48]
	ldr r0, _08062CDC @ =0x08BA43AC
	b _08062CF6
	.align 2, 0
_08062CD8: .4byte 0x081E96BC
_08062CDC: .4byte 0x08BA43AC
_08062CE0:
	ldr r0, _08062CE8 @ =0x081E96D2
	str r0, [r4, #0x48]
	ldr r0, _08062CEC @ =0x08BA43AC
	b _08062CF6
	.align 2, 0
_08062CE8: .4byte 0x081E96D2
_08062CEC: .4byte 0x08BA43AC
_08062CF0:
	ldr r0, _08062CFC @ =0x081E96D8
	str r0, [r4, #0x48]
	ldr r0, _08062D00 @ =0x08BA43C4
_08062CF6:
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	b _08062D1A
	.align 2, 0
_08062CFC: .4byte 0x081E96D8
_08062D00: .4byte 0x08BA43C4
_08062D04:
	ldr r0, _08062D50 @ =0x081E96FA
	str r0, [r4, #0x48]
	ldr r0, _08062D54 @ =0x08BA43C4
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldrb r1, [r6, #0x14]
	adds r0, r1, r6
	ldrb r1, [r0, #0x14]
	adds r0, r6, #0
	bl EfxPlaySEwithCmdCtrl
_08062D1A:
	ldr r0, _08062D58 @ =0x081F832C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08062D5C @ =0x081F9080
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08062D60 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08062D6E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08062D64
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08062D6E
	.align 2, 0
_08062D50: .4byte 0x081E96FA
_08062D54: .4byte 0x08BA43C4
_08062D58: .4byte 0x081F832C
_08062D5C: .4byte 0x081F9080
_08062D60: .4byte 0x0203E02C
_08062D64:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08062D6E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
