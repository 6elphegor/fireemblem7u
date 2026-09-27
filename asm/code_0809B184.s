	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B184
sub_0809B184: @ 0x0809B184
	push {r4, r5, r6, lr}
	ldr r6, _0809B18C @ =0x08C9F9F4
	b _0809B1B8
	.align 2, 0
_0809B18C: .4byte 0x08C9F9F4
_0809B190:
	ldrb r0, [r6]
	movs r1, #0
	bl MetaSave_SetMetCharacter
	ldrb r0, [r6, #1]
	movs r1, #0
	bl MetaSave_SetMetCharacter
	ldrb r4, [r6]
	ldrb r5, [r6, #1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetUnitsAverageSupportValue
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateBestGlobalSupportValue
	adds r6, #0x14
_0809B1B8:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0809B190
	pop {r4, r5, r6}
	pop {r0}
	bx r0
