	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxLvupOBJ2
NewEfxLvupOBJ2: @ 0x08069F60
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, _08069FB0 @ =0x08BDB7F4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08069FB4 @ =0x08B9CA30
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x64]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _08069FB8 @ =0x081E5D38
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08069FBC @ =0x081E565C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069FB0: .4byte 0x08BDB7F4
_08069FB4: .4byte 0x08B9CA30
_08069FB8: .4byte 0x081E5D38
_08069FBC: .4byte 0x081E565C
