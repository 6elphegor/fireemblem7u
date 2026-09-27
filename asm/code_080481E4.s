	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080481E4
sub_080481E4: @ 0x080481E4
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _0804822C @ =0x081C80C4
	ldr r1, _08048230 @ =0x081D55DE
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _08048234 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048222
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldr r1, _08048238 @ =0x02022860
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r2, _0804823C @ =0x0000033E
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
_08048222:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804822C: .4byte 0x081C80C4
_08048230: .4byte 0x081D55DE
_08048234: .4byte 0x0203DCE8
_08048238: .4byte 0x02022860
_0804823C: .4byte 0x0000033E
