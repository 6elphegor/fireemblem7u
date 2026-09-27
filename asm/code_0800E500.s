	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_PlaySe
EvtCmd_PlaySe: @ 0x0800E500
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E526
	ldr r0, _0800E52C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800E526
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl m4aSongNumStart
_0800E526:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E52C: .4byte 0x0202BBF8
