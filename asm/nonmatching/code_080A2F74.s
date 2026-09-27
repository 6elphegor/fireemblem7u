	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A2F74
sub_080A2F74: @ 0x080A2F74
	push {lr}
	sub sp, #0x20
	ldr r1, _080A2FB0 @ =0x0840F963
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	bl GetGameTime
	movs r1, #0x1f
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r3, [r0]
	adds r3, #0x10
	ldr r2, _080A2FB4 @ =0x02022860
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0x87
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
_080A2FB0: .4byte 0x0840F963
_080A2FB4: .4byte 0x02022860
