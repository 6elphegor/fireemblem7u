	.include "macro.inc"

	.syntax unified

	thumb_func_start Loop6C_efxSoundSE
Loop6C_efxSoundSE: @ 0x08067628
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08067642
	adds r0, r4, #0
	bl Proc_Break
	b _08067670
_08067642:
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08067670
	bl RegisterEfxSoundSeExist
	ldr r0, [r4, #0x44]
	bl Sound_SetBGMVolume
	ldr r0, _08067678 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0806766A
	ldr r0, [r4, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_0806766A:
	adds r0, r4, #0
	bl Proc_Break
_08067670:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067678: .4byte 0x0202BBF8
