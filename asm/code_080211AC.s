	.include "macro.inc"

	.syntax unified

	thumb_func_start SwingSwordfx_Loop
SwingSwordfx_Loop: @ 0x080211AC
	push {r4, r5, r6, lr}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r1, _08021204 @ =0x081C3C68
	mov r0, sp
	movs r2, #0x50
	bl memcpy
	ldr r1, _08021208 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	movs r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r3, r4, #0
	adds r1, #0x5e
_080211CC:
	movs r6, #0
	ldrsh r0, [r3, r6]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #2
	adds r2, #1
	cmp r2, #0xf
	ble _080211CC
	bl EnablePalSync
	ldrh r0, [r4]
	adds r0, #3
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _080211FC
	adds r0, r5, #0
	bl Proc_Break
_080211FC:
	add sp, #0x50
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021204: .4byte 0x081C3C68
_08021208: .4byte 0x02022860
