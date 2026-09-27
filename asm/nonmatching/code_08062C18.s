	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxMagfcast
NewEfxMagfcast: @ 0x08062C18
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08062C5C @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _08062C70
	bl SpellFx_SetBG1Position
	ldr r0, _08062C60 @ =0x08BA437C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	strh r4, [r5, #0x2c]
	ldr r4, _08062C64 @ =0x0203E08E
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x57
	blt _08062C68
	cmp r0, #0x58
	bgt _08062C68
	ldr r0, [r5, #0x5c]
	adds r1, r7, #0
	bl sub_08062C94
	b _08062C70
	.align 2, 0
_08062C5C: .4byte 0x0201774C
_08062C60: .4byte 0x08BA437C
_08062C64: .4byte 0x0203E08E
_08062C68:
	ldr r0, [r5, #0x5c]
	adds r1, r7, #2
	bl sub_08062C94
_08062C70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
