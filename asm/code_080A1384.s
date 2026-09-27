	.include "macro.inc"

	.syntax unified

	thumb_func_start IsValidSuspendSave
IsValidSuspendSave: @ 0x080A1384
	push {r4, lr}
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A13C8
	cmp r4, #3
	bne _080A13C8
	ldr r4, _080A13CC @ =0x0203ECC4
	bl GetLastSuspendSaveId
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A13D0
	bl GetNextSuspendSaveId
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A13D0
	movs r0, #0x7f
	strb r0, [r4]
_080A13C8:
	movs r0, #0
	b _080A13D2
	.align 2, 0
_080A13CC: .4byte 0x0203ECC4
_080A13D0:
	movs r0, #1
_080A13D2:
	pop {r4}
	pop {r1}
	bx r1
