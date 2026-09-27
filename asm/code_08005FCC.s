	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005FCC
sub_08005FCC: @ 0x08005FCC
	push {lr}
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	ldr r2, _08005FEC @ =0x02022860
	lsls r0, r0, #1
	ldr r1, _08005FF0 @ =0x08194734
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08005FEC: .4byte 0x02022860
_08005FF0: .4byte 0x08194734
