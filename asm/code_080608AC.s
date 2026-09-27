	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080608AC
sub_080608AC: @ 0x080608AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060910 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060914 @ =0x08BA3BFC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08060918 @ =0x081E9360
	str r0, [r5, #0x48]
	ldr r0, _0806091C @ =0x08BA3C14
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060920 @ =0x08298D58
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060924 @ =0x08299F70
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08060928 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060936
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806092C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08060936
	.align 2, 0
_08060910: .4byte 0x0201774C
_08060914: .4byte 0x08BA3BFC
_08060918: .4byte 0x081E9360
_0806091C: .4byte 0x08BA3C14
_08060920: .4byte 0x08298D58
_08060924: .4byte 0x08299F70
_08060928: .4byte 0x0203E02C
_0806092C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08060936:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
