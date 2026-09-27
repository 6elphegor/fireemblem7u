	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPlaySE
EfxPlaySE: @ 0x080675C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _08067608 @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0806761E
	bl CheckEfxSoundSeExist
	cmp r0, #0
	bne _08067610
	bl RegisterEfxSoundSeExist
	adds r0, r5, #0
	bl Sound_SetBGMVolume
	ldr r0, _0806760C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0806761E
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _0806761E
	.align 2, 0
_08067608: .4byte 0x0202BBB8
_0806760C: .4byte 0x0202BBF8
_08067610:
	ldr r0, _08067624 @ =0x08BDAF68
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	strh r4, [r0, #0x2c]
_0806761E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067624: .4byte 0x08BDAF68
