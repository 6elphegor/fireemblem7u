	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E0B8
sub_0803E0B8: @ 0x0803E0B8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _0803E0C8
_0803E0C0:
	adds r0, r4, #0
	bl DrawLinkArenaTeamName
	adds r4, #1
_0803E0C8:
	ldr r0, [r5, #0x38]
	cmp r4, r0
	blt _0803E0C0
	pop {r4, r5}
	pop {r0}
	bx r0
