	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A54C8
sub_080A54C8: @ 0x080A54C8
	push {lr}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A54F4
	ldr r2, _080A54F0 @ =0x02022860
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080A5502
	.align 2, 0
_080A54F0: .4byte 0x02022860
_080A54F4:
	ldr r0, _080A550C @ =0x02022860
	ldr r2, _080A5510 @ =0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080A5502:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080A550C: .4byte 0x02022860
_080A5510: .4byte 0x0000033A
