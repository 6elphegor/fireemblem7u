	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxDanceOBJ
NewEfxDanceOBJ: @ 0x080632D4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063334 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063338 @ =0x08BA44AC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x19
	strh r0, [r4, #0x2e]
	ldr r3, _0806333C @ =0x08BA6630
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _08063340 @ =0x081EB900
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063344 @ =0x081EB78C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe1
	movs r3, #1
	bl PlaySFX
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063334: .4byte 0x0201774C
_08063338: .4byte 0x08BA44AC
_0806333C: .4byte 0x08BA6630
_08063340: .4byte 0x081EB900
_08063344: .4byte 0x081EB78C
